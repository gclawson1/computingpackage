library(testthat)
library(computingpackage)


test_that("temp_risk_works" ,
          {rain_data = as.data.frame(cbind(Date = c("2012-01-22", "2013-03-14", "2014-11-01", "2015-12-21"), Location = c("Brisbane", "Brisbane", "Brisbane", "Brisbane"),
                                           Rainfall=rep(1, times=4), Temp3pm = rep(41, times = 4)))
          rain_data$Temp3pm <- as.numeric(as.character(rain_data$Temp3pm))




          expect_that(temp_risks(rain_data)$table$heat_stroke_n, equals(4))
          })
