library(ggplot2)
library(data.table)
library(rstan)
library(bayesplot)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write=TRUE)

tsuga = readRDS("exercises/data/tsuga_spatial.rds")


xvars = as.matrix(tsuga[, .(annual_mean_temp, tot_annual_pp)])
xvars = scale(xvars)

# transform coordinates to be a little easier to fit
# note that the scale must be the same for X and Y, so that
# we can continue to interpret them as being in distance units
coords = as.matrix(tsuga[, .(X, Y)])
coords = coords/100000 ## convert to 100 km
coords = apply(coords, 2, function(x) x - min(x)) ## set the minimum to zero


## two different datasets, one with precip, one without
standat = list(
	n = nrow(tsuga),
	died = tsuga$died,
	ntrees = tsuga$n,
	x = xvars[,1,drop=FALSE],
	coords = coords
)
standat$k = ncol(standat$x)
standat_pp = standat
standat_pp$x = xvars
standat_pp$k = ncol(standat_pp$x)

## this was run to assess convergence, but it's too big to work with
# models = list(
# 	mod_t = stan("../R/tsuga_nonspatial.stan", data = standat, chains = 1, iter=10000),
# 	mod_gp = stan("../R/tsuga_gp_only.stan", data = standat, chains = 4, iter=50000, 
# 		control=list(adapt_delta = 0.94)),
# 	mod_gp_t = stan("../R/tsuga_gp_env.stan", data = standat, chains = 4, iter=50000, 
# 		control=list(adapt_delta = 0.9)),
# 	mod_gp_tp = stan("../R/tsuga_gp_env.stan", data = standat_pp, chains = 4, iter=50000, 
# 		control=list(adapt_delta = 0.9)))

models = list(
	mod_t = stan("../R/tsuga_nonspatial.stan", data = standat, chains = 1, iter=10000),
	mod_gp = stan("../R/tsuga_gp_only.stan", data = standat, chains = 1, iter=50000, 
		control=list(adapt_delta = 0.94)),
	mod_gp_t = stan("../R/tsuga_gp_env.stan", data = standat, chains = 1, iter=50000, 
		control=list(adapt_delta = 0.9)),
	mod_gp_tp = stan("../R/tsuga_gp_env.stan", data = standat_pp, chains = 1, iter=50000, 
		control=list(adapt_delta = 0.9)))

# if this ends with an error, try reducing iter for the last 3 models to 25000
loos = lapply(models, loo, pars="loglik")

dir.create("../scratch")
saveRDS(models, "../scratch/gp_models.rds")
saveRDS(loos, "../scratch/gp_loos.rds")
saveRDS(standat, "../scratch/standat.rds")
saveRDS(standat_pp, "../scratch/standat_pp.rds")
