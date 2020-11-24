library(data.table)
library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

dat = readRDS("~/work/teaching/BayesCourseIGB/data/trees.rds")
spp = data.table(species = c("18032-ABI-BAL", "19489-BET-PAP", "28731-ACE-SAC", 
			"195773-POP-TRE", "183397-TSU-CAN"), 
			species_name = c("Abies balsamifera", "Betula papyrifera", "Acer saccharum",
			"Populus tremuloides", "Tsuga canadensis"))
years = c(1975, 1980, 1985, 1988, 1989, 1990, 1993:2012)
dat = dat[spp, , on = "species"][year %in% years, 
			.(n, died, year, species_name, annual_mean_temp, tot_annual_pp, prior_mu)]
dat = dat[n > 0]
fwrite(dat, "docs/exercises/data/treedata.csv", row.names=FALSE)

