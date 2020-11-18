#' Simple single-parameter adaptive metropolis
#' @param target Target function (returning log unnormalised posterior density);
#' 	this function should take the parameter as its first argument and a data list as its second
#' @param initial Initial value of the parameter
#' @param data Data to pass to the target
#' @param iter Number of iterations
#' @param scale Scale for the proposal distribution, if NA, the algorithm will adaptively
#' 		choose a scale
#' @param ... Additional named parameters to pass to m_adapt
#' 
#' @return A list, with three components: 'chain' is the markov chain, 'scale' 
#' 		is the scale parameter used, and 'accept' is the acceptance rate
metropolis = function(target, initial, data, iter = 5000, scale = NA, ...) {

	# check that the target distribution is defined at the initial value
	if(!is.finite(target(initial, data)))
		stop("Target distribution undefined at the initial value, choose better inits")

	# adaptation, if needed
	if(is.na(scale))
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
#' @param state Initial state (parameter value)
#' @param data Data to pass to the target
#' @param iter Number of iterations
#' @param scale Scale for the proposal distribution
#' @return A list with two elements, chain (the markov chan) and accept, the acceptance rate
m_sample = function(target, state, data, scale, iter) {
	# set up the markov chain
	chain = numeric(iter)

	# keep track of how many times we accept the proposals
	# the acceptance rate is an important diagnostic
	accept = 0

	for(i in 1:iter) {
		# propose a value and accept/reject, updating the chain with the new value
		chain[i] = m_propose(state, scale, target, data)
		
		if(chain[i] != state) {
			# if the value changed, that was an acceptance
			# increment the accept variable, and update state
			accept = accept + 1
			state = chain[i]
		}	
	}

	return(list(chain = chain, accept = accept/iter))
}

#' Runs the adaptation phase of the metropolis sampler
#' @param target Target function
#' @param initial Initial value of the parameter
#' @param data Data to pass to the target
#' @param chunk_size Number of iterations in each chunk before adapting
#' @param max_chunk Maximum number of chunks before stopping adaptation
#' @param accept_range Target range of acceptance rates
#' @param scale Initial guess for the scale
#' @param scale_step By how much should we multiply the scale if the acceptance is too large,
#' 		or divide if the acceptance rate is too small
#' @return Scale parameter after adaptation
m_adapt = function(target, initial, data, chunk_size = 100, max_chunk = 100, 
			accept_range = c(0.2, 0.4), scale = 1, scale_step = 1.1) {

	accept_rate = 0
	nchunk = 0
	while(nchunk < max_chunk & (accept_rate < min(accept_range) | 
							accept_rate > max(accept_range))) {
		chunk = m_sample(target, initial, data, scale, iter = chunk_size)
		accept_rate = chunk$accept
		initial = chunk$chain[length(chunk$chain)]

		if(accept_rate < min(accept_range)) {
			scale = scale / scale_step
		} else if(accept_rate > min(accept_range)) {
			scale = scale * scale_step
		}
		nchunk = nchunk + 1
	}
	cat("Finished adaptation after", nchunk, "chunks of", chunk_size, 
		"iterations; acceptance rate:\n", "   ", accept_rate, "\n")
	return(scale)
}


#' Simpler adaptation phase, converges around 50% acceptance
#' @param target Target function
#' @param initial Initial value of the parameter
#' @param data Data to pass to the target
#' @param scale Initial guess for the scale
m_adapt_simple = function(target, initial, data, scale = 1, adapt_iter = 5000) {
	accept = 0
	chain = numeric(adapt_iter)

	state = initial
	for(i in 1:adapt_iter) {
		# propose a value and accept/reject, updating the current state with the new value
		chain[i] = m_propose(state, scale, target, data)

			if(chain[i] == state) {  
				## rejection, decrease the scale
				scale = scale / 1.1
			} else { 
				## acceptance, increase the scale, acceptance rate, and update state
				scale = scale * 1.1
				accept = accept + 1
				state = chain[i]
			}
	}
	cat("Finished adaptation; acceptance rate = ", accept/adapt_iter, "\n")
	return(scale)
}



#' Propose and select candidate values for the metropolis algorithm
#' @param state Current state of the chain
#' @param scale Scale of the proposal distribution
#' @param target Target distribution density function
#' @param data Data for the target distribution
#' @return New value in the chain
m_propose = function(state, scale, target, data) {
	# choose a candidate value from the proposal distribution
	candidate = rnorm(1, state, scale)

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
	# could also use sample() to do this, but it's slower
	U = runif(1)
	if(U < r) {
		val = candidate
	} else {
		val = state
	}
	return(val)
}



#' Compute highest posterior density interval for a single parameter
#' @param samples A vector of mcmc samples
#' @param density The (minimum) probability density contained in the interval
hpdi = function(samples, density = 0.9) {
	n = length(samples)
	samples = sort(samples)
	n_include = ceiling(density * n)
	lower = 1:(n - n_include)
	upper = lower + n_include
	width = samples[upper] - samples[lower]
	i = which.min(width)
	c(samples[lower[i]], samples[upper[i]])	
}

