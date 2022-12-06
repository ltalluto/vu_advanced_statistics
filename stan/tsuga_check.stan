data {
  // number of data points
	int <lower=0> n; 
	
	// response
	// number of trees in each plot
	int <lower=1> n_trees [n]; 
	
	// number died
	int <lower=0> died [n]; 

	// predictors
	vector [n] temperature;
	vector [n] pp;
	
	// grouping
	int <lower=1> n_years;
	int <lower=1> year_id [n];
}
parameters {
	vector [n_years] a;
	vector [5] b;
	
	// average intercept by year
	real a_mu; 
	// sd of intercepts
	real <lower=0> a_sig; 

}
transformed parameters {
	vector [n] p;
	for(i in 1:n) {
		p[i] = inv_logit(a[year_id[i]] + b[1] * temperature[i] + b[2] * temperature[i]^2 + b[3] * pp[i] + b[4] * pp[i]^2 + b[5] * temperature[i] * pp[i]);
	}
}
model {
	died ~ binomial(n_trees, p);
	// priors
	// hierarchical prior for a
	a ~ normal(a_mu, a_sig); 
	b ~ normal(0, 10);

	a_mu ~ normal(0, 20);
	a_sig ~ gamma(0.1, 0.1);
}
generated quantities {
	int died_sim [n];
	for (i in 1:n) {
		died_sim[i] = binomial_rng(n_trees[i], p[i]);
	}
}
