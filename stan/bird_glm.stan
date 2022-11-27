data {
	int <lower=0> n; // number of data points
	int <lower=0> k; // number of x-variables
	int <lower=0> richness [n];
	matrix [n,k] X;
}
parameters {
	real a;
	vector [k] B;
}
transformed parameters {
	vector <lower=0> [n] lambda;
	lambda = exp(a + X * B);
}
model {
	richness ~ poisson(lambda);
	a ~ normal(0, 10);
	B ~ normal(0, 5);
}
generated quantities {
	int r_predict [n];
	for(i in 1:n)
		r_predict[i] = poisson_rng(lambda[i]);
	r_predict = poisson_rng(lambda);
}
