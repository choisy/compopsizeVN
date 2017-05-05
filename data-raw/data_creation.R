library(rgdal)
communes <- readOGR("data-raw", "Vietnam_pop_commune")
communes@data$province <- sub("Thua Thien Hue", "Thua Thien - Hue", communes@data$PRO_NAME_E)
devtools::use_data(communes, overwrite = TRUE)
