library(rgdal)
communes <- readOGR("data-raw", "Vietnam_pop_commune")
communes@data$PRO_NAME_E <- sub("Thua Thien Hue", "Thua Thien - Hue", communes@data$PRO_NAME_E)
communes@data$ADDRESS <- NULL
communes@data$Shape_Le_1 <- NULL
names(communes@data) <- c("commune_id", "district_id", "commune_vn", "commune",
                          "district_vn", "district", "province_vn", "province",
                          "province_id", "population", "area", "shape_length",
                          "shape_area")
communes@data <- communes@data[, c("province_id", "district_id", "commune_id",
                                   "province", "district", "commune",
                                   "province_vn", "district_vn", "commune_vn",
                                   "population", "area", "shape_length", "shape_area")]
rownames(communes@data) <- NULL
devtools::use_data(communes, overwrite = TRUE)
