data {
	int <lower=1> n; // number of sites 
	int <lower=1> k; // number of predictors for the non-spatial process

	int died [n]; // response
	int ntrees [n];
	vector [2] coords [n]; // spatial coordinates, x first, then y
	matrix [n,k] x; // predictor variables

}
transformed data {
	real delta = 1e-9;
}
parameters {
	// hyperparameters
	real <lower=0> rho; // spatial process lengthscale
	real <lower=0> alpha; // this is a covariance kernel parameter, NOT an intercept

	// regression parameters
	real a; // intercept
	vector [k] b; // slope vector
	
	// scaled latent GP effect
	vector [n] eta;
}
transformed parameters {
	vector [n] mu; // expectation of y
	{
		// compute variance-covariance matrix due to euclidean distance
		matrix[n, n] Sig; // variance-covariance matrix
		matrix[n, n] L_Sig; // cholesky decomposition of VCV matrix
		vector [n] gamma; // additive effect of GP, at response scale
		
		Sig = cov_exp_quad(coords, alpha, rho);

		// adjust diagonals
		for (i in 1:n)
    		Sig[i, i] = Sig[i, i] + delta;
		L_Sig = cholesky_decompose(Sig);
		gamma = L_Sig * eta;
		mu = inv_logit(gamma + a + x * b);
	}
}
model {
	rho ~ inv_gamma(5, 5);
	alpha ~ normal(0, 10);
	eta ~ std_normal();
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
