library(testthat)
library(computingpackage)


test_that("mean_rainfall_works" ,
          {rain_data = as.data.frame(cbind(Date = c("2012-01-22", "2013-03-14", "2014-11-01", "2015-12-21"), Location = c("Brisbane", "Brisbane", "Brisbane", "Brisbane"),
                                           Rainfall=rep(1, times=4)))
          rain_data$Rainfall <- as.numeric(rain_data$Rainfall)




          expect_that(mean_rainfall(rain_data, plot_out=TRUE)$rain_table$mean_rainfall, equals(c(1,1,1,1)))
})


