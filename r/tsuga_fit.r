library(ggplot2)
library(data.table)
library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write=TRUE)

set.seed(12345)
tsuga = readRDS("exercises/data/tsuga_spatial.rds")
tsuga = tsuga[Y > 2300000]
ind = which(tsuga$X > 1500000)
ind2 = sample(ind, length(ind)/2)
tsuga = rbind(tsuga[-ind], tsuga[ind2])
nrow(tsuga)

ggplot(tsuga, aes(x=X, y=Y, colour = died/n)) + geom_point()


xvars = as.matrix(tsuga[, .(annual_mean_temp, tot_annual_pp)])
xvars = scale(xvars)

# rescale coordinates to be from 0 to 1
coords = as.matrix(tsuga[, .(X, Y)])
coords = scale(coords)


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

mod_t = stan("../R/tsuga_nonspatial.stan", data = standat, chains = 4, iter=5000)
mod_gp = stan("../R/tsuga_gp.stan", data = standat, chains = 4, iter=5000, refresh = 500)

