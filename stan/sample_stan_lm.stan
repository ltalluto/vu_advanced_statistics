data {
   int n; // a single integer named n, number of data points
   vector [n] y; // a vector of n real numbers, named y
   vector [n] x;
}
parameters {
   real a;
   real b;
   real <lower=0> s; // a single real number that must be positive
}
transformed parameters {
	vector [n] mu = a + b * x;
}
model {
	y ~ normal(mu, s);
	a ~ normal(0, 10);
	b ~ normal(0, 5);
	s ~ exponential(0.1);
}
