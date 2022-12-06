// file: stan/tsuga_pooled.stan
data {
	// number of data points
	int <lower=0> n; 
	
	// number of trees in each plot
	int <lower=1> n_trees [n]; 

	// number died
	int <lower=0> died [n]; 
	vector [n] precip;
}
parameters {
	real a;
	real b;
}
transformed parameters {
	vector <lower=0, upper=1> [n] p;
	p = inv_logit(a + b * precip);
}
model {
	died ~ binomial(n_trees, p);
	a ~ normal(0, 10);
	b ~ normal(0, 5);
}
generated quantities {
	// we use generated quantities to keep track of log likelihood and
	// deviance, useful for model selection
	// and also to perform poserior predictive simulations
	real deviance = 0;
	vector [n] loglik;
	int ppd_died [n];
	for (i in 1:n) {
		loglik[i] = binomial_lpmf(died[i] | n_trees[i], p[i]);
		deviance += loglik[i];
		ppd_died[i] = binomial_rng(20, p[i]);
	}
	deviance = -2 * deviance;
}
