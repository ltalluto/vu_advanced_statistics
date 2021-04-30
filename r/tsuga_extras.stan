functions {
	matrix matern_cov (matrix dist, real rho, real sigma, real delta) {
		int NR = rows(dist);
		matrix [NR,NR] result;
		
		for(i in 1:(NR-1)) {
			result[i,i] = sigma^2 + delta;
			for(j in (i+1):NR) {
				real mpar = (sqrt(3.0) * dist[i,j])/(rho);
				result[i,j] = sigma^2 * (1 + (mpar)) * (exp(-1*mpar));
				result[j,i] = result[i,j];
			}
		}
		result[NR,NR] =  sigma^2 + delta;
		return(result);
	}
}
