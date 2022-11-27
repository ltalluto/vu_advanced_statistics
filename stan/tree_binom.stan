data {
   int n; // number of plots
   int n_died [n]; // number of dead trees in each plot
   int n_total [n]; // number of trees in each plot 
   vector [n] annual_mean_temp; // temperature
}
parameters {
   real a;
   real b;
   // no s: there is no variance parameter
   // for the binomial distribution!
}
transformed parameters {
	// option 1 - use inv_logit
	vector [n] p = inv_logit(a + b * annual_mean_temp);
	// option 2 - use binomial_logit
	// vector [n] alpha = a + b * annual_mean_temp
}
model {
	// option 1: use inv_logit
	n_died ~ binomial(n_total, p);
	// option 2: use binomial_logit
	// n_died ~ binomial_logit(n_total, alpha);
	
	// priors are the same regardless
	a ~ normal(0, 10);
	b ~ normal(0, 5); 
}
