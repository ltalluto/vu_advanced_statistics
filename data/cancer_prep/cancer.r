library(sf)
library(data.table)
library(ggplot2)
cancer = rbind(fread("gd80to84.txt"), fread("gd85to89.txt"))

# aggregate the two datasets by averaging the rates
# also convert counties to lower case for merging with spatial data
cancer$state = tolower(cancer$state)
cancer$county = tolower(cancer$county)
cancer$state = gsub("\\.", " ", cancer$state)
cancer$county = gsub("\\.", " ", cancer$county)
cancer$county = sub(" ci?t?y?$", "", cancer$county)
cancer$county = sub("(saintess |ste )", "ste. ", cancer$county)
cancer$county = sub("saint", "st.", cancer$county)
cancer$county = sub("maa?c ", "mc", cancer$county)
cancer[state == "idado", state := "idaho"]
cancer[county == "hakon", county := "haakon"]
cancer[county == "breckenridge", county := "breckinridge"]
cancer[county == "carson" & state == "nevada", county := "carson city"]
cancer[county == "charles" & state == "virginia", county := "charles city"]
cancer[county == "mckean", county := "mc kean"]
cancer[county == "o brien", county := "o'brien"]
cancer[county == "la moure", county := "lamoure"]
cancer[county == "st. john the ba", county := "st. john the b"]
cancer[county == "james", county := "james city"]
cancer[county == "lunenberg", county := "lunenburg"]
cancer = cancer[, .(state, county, kidney_cancer_deaths = dc, population = pop, 
	death_rate_per_1000 = dc/(pop/1000))]
cancer_flat = cancer[, .(kc_deaths = mean(kidney_cancer_deaths), population = mean(population), 
	death_rate_per_1000 = mean(death_rate_per_1000)), by = .(state, county)]

counties = st_read("co99_d90_shp/co99_d90.shp")
counties$NAME = tolower(counties$NAME)
counties$ST = as.integer(counties$ST)
codes = fread("statecodes.txt")
counties = merge(counties, codes, by.x = "ST", by.y = "STATEFP")
counties$state = tolower(counties$STATE_NAME)
counties[counties$NAME == "dekalb",]$NAME = "de kalb"
counties[counties$NAME == "debaca",]$NAME = "de baca"
counties[counties$NAME == "desoto",]$NAME = "de soto"
counties[counties$NAME == "dewitt",]$NAME = "de witt"
counties[counties$NAME == "dupage",]$NAME = "du page"
counties$NAME = sub("'s", "s", counties$NAME)
counties$county = substr(counties$NAME, 1, 14)
counties = counties[!counties$ST %in% c(2, 15, 60, 66, 69, 72, 74, 78),] 

# test merge, to make sure we haven't lost any counties that we don't want to lose
# test = merge(cancer_flat, counties, by.y = c("NAME", "state"), by.x = c("county", "state"), all.x = TRUE)
# test = test[is.na(STATE)]
# test

counties = merge(counties, cancer_flat, all.y = TRUE, by.y = c("county", "state"), 
	by.x = c("county", "state"))

counties = within(counties, {
	quantile = ifelse(
		death_rate_per_1000 >= quantile(death_rate_per_1000, 0.9, na.rm = TRUE), "Highest 10%",
		ifelse(death_rate_per_1000 <= quantile(death_rate_per_1000, 0.1, na.rm = TRUE), "Lowest 10%",
		"Middle 80%"))
})

st_crs(counties) = 4269
counties = st_transform(counties, crs = "ESRI:102008")

saveRDS(cancer, "~/projects_git/teaching/vu_advanced_statistics/vu_advstats_students/data/us_k_cancer.rds")

counties = counties[, c("county", "state", "kc_deaths", "population", "death_rate_per_1000", "quantile", "geometry")]
st_write(counties, "~/projects_git/teaching/vu_advanced_statistics/vu_advstats_students/data/us_k_cancer_spatial.gpkg")


ggplot(counties) + 
	geom_sf(aes(fill = population, colour = population)) + 
	scale_fill_viridis_c("Population size", option = "magma", trans = "log10") + 
	scale_colour_viridis_c("Population size", option = "magma", trans = "log10")


