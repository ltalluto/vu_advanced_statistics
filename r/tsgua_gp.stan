data {
	int <lower=1> n; // number of sites 

	int died [n]; // response
	int ntrees [n];
	matrix [n,2] coords; // spatial coordinates, x first, then y
}
parameters {
	// hyperparameters
	real <lower=0> rho; // spatial process lengthscale
	real <lower=0> sigma; // error term in VCV matrix

	
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
		
		Sig = matern_cov(d, rho, sigma, delta);
		L_Sig = cholesky_decompose(Sig);
		gamma = L_Sig * eta;
		mu = inv_logit(gamma);
	}
}
model {
	rho ~ inv_gamma(5, 5);
	sigma ~ normal(0, 5);
	eta ~ std_normal();

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