#' max_rainfall
#'
#' compute maximum precipitation each year for a specified location during a specified month and output that year, location, month, and precipitation level.
#' @param rain_data data frame with columns Date, Location, Rainfall
#' @param location specified location in the data frame you want to see, default is Brisbane
#' @param years specified years in the data frame you want to see, default is 2009 to 2017
#' @param month_spec specified month in the data frame you want to see, default is 4 (april)
#' @return returns a list containing,
#' \describe{
#'  \item{Location}{Location specified}
#'  \item{Month}{Month specified}
#'  \item{Max_rainfall}{The maximum rainfall (mm) for each year in the dataset}
#'  }
#'

max_rainfall = function(rain_data, location = "Brisbane", years = 2009:2017, month_spec = 4){

  rain_df <- rain_data %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    dplyr::filter(Location == location, year %in% years, month == month_spec) %>%
    dplyr::select(year, month, day, Rainfall)

  rain_array <- array(data = rain_df$Rainfall,
                        dim = c(30, 9),
                        dimnames = list(
                                         1:30, ### day labels
                                        2009:2017)) ### year labels

  rain_month_max <- apply(rain_array, MARGIN = 2, FUN = max, na.rm = TRUE)

  return(
    list(Location = location,
         Month = month_spec,
         Max_rainfall = rain_month_max)
  )

}


