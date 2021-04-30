#' Multivariate metropolis (i.e., metropolis within gibbs) sampler
#' @param target Target function (returning log unnormalised posterior density);
#' 	this function should take the parameter as its first argument and a data list as its second
#' @param initial Initial parameter vector
#' @param data Data to pass to the target
#' @param iter Number of iterations
#' @param scale Scale vector for the proposal distributions, if NA, the algorithm will adaptively
#' 		choose scales
#' @param n_adapt Number of iterations for adaptation, if needed
#' @param ... Additional named parameters to pass to m_adapt
#' 
#' @return A list, with three components: 'chain' is the markov chain, 'scale' 
#' 		is the scale parameter used, and 'accept' is the acceptance rate
metropolis = function(target, initial, data, iter = 1000, scale = NA, ...) {

	# check that the target distribution is defined at the initial value
	if(!is.finite(target(initial, data)))
		stop("Target distribution undefined at the initial value, choose better inits")

	# adaptation, if needed
	if(any(is.na(scale)))
		scale = m_adapt(target, initial, data, ...)


	# do the sampling
	result = m_sample(target, initial, data, scale, iter)
	
	# save the scale as well, because this allows resuming the chain
	result$scale = scale
	return(result)
}


#' Worker function to actually do the sampling
#' @param target Target function (returning log unnormalised posterior density);
#' 	this function should take the parameter as its first argument and a data list as its second
#' @param state Initial state vector (parameter values)
#' @param data Data to pass to the target
#' @param scale Scale for the proposal distributions
#' @param iter Number of iterations
m_sample = function(target, state, data, scale, iter) {
	# number of parameters
	k = length(state)

	# set up the markov chain
	chain = matrix(NA, nrow=iter, ncol=k)
	colnames(chain) = names(state)


	# keep track of how many times we accept the proposals
	# the acceptance rate is an important diagnostic
	accept = rep(0, k)


	for(i in 1:(iter)) {
		# for multivariate problems, it's helpful to keep track of the previous state as well
		prev_state = state

		# for each iteration, we need to randomize the order of parameters
		jj = sample(k)

		# loop over parameters one at a time
		for(j in jj) {
			# propose a value and accept/reject, updating the current state with the new value
			state = m_propose(state, scale, target, data, j)
			if(state[j] != prev_state[j]) {
				# if the value changed, that was an acceptance, increment accept variable
				accept[j] = accept[j] + 1
			}
		}
		# after we have proposed for each parameter, update the chain
		chain[i, ] = state
	}
	return(list(chain = chain, accept = accept/iter))
}



#' Runs the adaptation phase of the metropolis sampler
#' @param target Target function
#' @param state Initial vector of k parameter values
#' @param data Data to pass to the target
#' @param chunk_size Number of iterations in each chunk before adapting
#' @param max_chunk Maximum number of chunks before stopping adaptation
#' 		or divide if the acceptance rate is too small; should be a vector of length k
#' @param accept_range Target range of acceptance rates
#' @param scale Optional initial guess for the scale vector, default 1
#' @param scale_step Optional, how large the adaptation steps are, default 1.1
#' @return Scale parameter after adaptation
m_adapt = function(target, state, data, chunk_size = 100, max_chunk = 100, 
			accept_range = c(0.2, 0.4), scale, scale_step) {
	k = length(state)
	accept_rate = rep(0, k)
	if(missing(scale))
		scale = rep(1, k)
	if(missing(scale_step)) {
		scale_step = rep(1.1, k)
	} else if(any(scale_step <= 1)) {
		stop("Scale step must be greater than one")
	}
	nchunk = 0
	while(nchunk < max_chunk & (any(accept_rate < min(accept_range)) | 
							any(accept_rate > max(accept_range)))) {
		chunk = m_sample(target, state, data, scale, iter = chunk_size)
		accept_rate = chunk$accept
		state = chunk$chain[nrow(chunk$chain),]

		for(j in 1:k) {
			if(accept_rate[j] < min(accept_range)) {
				scale[j] = scale[j] / scale_step[j]
			} else if(accept_rate[j] > min(accept_range)) {
				scale[j] = scale[j] * scale_step[j]
			}
		}
		nchunk = nchunk + 1
	}
	cat("Finished adaptation after", nchunk, "chunks of", chunk_size, 
		"iterations; acceptance rate:\n", "   ", accept_rate, "\n")
	return(scale)
}



#' Propose and select candidate values for the metropolis-hastings algorithm
#' @param state Current state of the chain
#' @param scale Scale of the proposal distribution
#' @param target Target distribution density function
#' @param data Data for the target distribution
#' @param j Index of the state/scale vectors to propose, others will be held constant
#' @return New value in the chain
m_propose <- function(state, scale, target, data, j) {
	# choose a candidate value from the proposal distribution (rnorm)
	candidate = state
	candidate[j] = rnorm(1, state[j], scale[j])

	# compute the log posterior density at the current state and the candidate value
	ld_cand = target(candidate, data)
	ld_current = target(state, data)

	# compute the acceptance probability r, making sure the density is finite
	# r is the ratio of densities: (d_cand / d_current)
	# because r should be the exponential of the difference of log densities
	if(!is.finite(ld_cand)) {
		r = 0
	} else {
		r = exp(ld_cand - ld_current)
	}

	# now choose a value such that the chance of choosing d_cand is equal to r
	# the easiest way is to draw a random uniform number U on (0,1) and compare it to r
	# pr(U < r) = r (acceptance), pr(U >= r) = 1 - r (rejection)
	# could also use sample() to do this
	U = runif(1)
	if(U < r) {
		val = candidate
	} else {
		val = state
	}
	return(val)
}


#' Computes a multivariate hpdi interval
#' 
#' Assumes a unimodal posterior distribution
#' @param samples A matrix of mcmc samples
#' @param posterior A function returning the log unnormalized posterior density
#' @param data The data used to compute the samples
#' @param density The (minimum) probability density contained in the interval
hpdi = function(samples, posterior, data, density = 0.9) {

	# compute the indices of all possible intervals
	n = nrow(samples)
	n_include = ceiling(density * n)
	lower = 1:(n - n_include)
	upper = lower + n_include

	# sort the samples by their posterior density
	dens = apply(samples, 1, posterior, data = data)
	ind = order(dens)
	dens = dens[ind]
	samples = samples[ind, ]

	# compute the width for each variable, then the area in the parameter dimension
	area = mapply(function(l, u, samp) 
		prod(apply(samp, 2, function(x) x[u[i]] - x[l[i]])), 
		l = lower, u = upper, moreArgs = list(samp = samples))

	i = which.min(area)
	cbind(samples[lower[i], ], samples[upper[i], ])
}
