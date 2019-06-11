library(testthat)
library(computingpackage)


test_that("water_supply_works" ,
          {rain_data = as.data.frame(cbind(Date = c("2012-01-22", "2013-03-14", "2014-11-01", "2015-12-21"), Location = c("Brisbane", "Brisbane", "Brisbane", "Brisbane"),
                                           Rainfall=rep(1, times=4)))
          rain_data$Rainfall <- as.numeric(as.character(rain_data$Rainfall))




          expect_that(water_supply(rain_data)$table$annual_rainfall, equals(c(1,1,1,1)))
          })
