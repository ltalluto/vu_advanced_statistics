data {
	int <lower=1> n; // number of sites 
	int <lower=1> k; // number of predictors for the non-spatial process

	int died [n]; // response
	int ntrees [n];
	matrix [n,k] x; // predictor variables
}
parameters {
	// regression parameters
	real a;
	vector [k] b;
}
transformed parameters {
	vector [n] mu; // expectation of y
	mu = inv_logit(a + x * b);
}
model {
	a ~ normal(0, 10);
	b ~ normal(0, 5);
	died ~ binomial(ntrees, mu);
}
generated quantities {
	int died_sim [n];
	vector [n] loglik;
	for (i in 1:n) {
		died_sim[i] = binomial_rng(ntrees[i], mu[i]);
		loglik[i] = binomial_lpmf(died[i] | ntrees[i], mu[i]);
	}
}
