// file: stan/tsuga_unpooled.stan
data {
	// same as in the pooled model
	int <lower=0> n; 
	int <lower=1> n_trees [n]; 
	int <lower=0> died [n]; 
	vector [n] precip;
	
	// grouping variables
	// year_id is an integer starting at 1 (the earliest year)
	// ending at n_groups (the latest year)
	// we use this value as an index for any group-level effects
	int <lower=1> n_groups;
	int <lower=1, upper = n_groups> year_id [n];

}
parameters {
	// one intercept per group
	vector [n_groups] a;
	real b;
}
transformed parameters {
	vector <lower=0, upper=1> [n] p;
	
	// a is different for each data point, depending on the group
	// so we need a loop to compute this
	for(i in 1:n) {
		int gid = year_id[i];
		p[i] = inv_logit(a[gid] + b * precip[i]);
	}
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
