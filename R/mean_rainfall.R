#' mean_rainfall
#'
#' compute mean precipitation for all years in the dataset and a specified location and output that year, location, and precipitation level.
#' @param rain_data data frame with columns Date, Location, and Rainfall
#' @param location specified location in the data frame you want to see, default is Brisbane
#' @return returns a list containing,
#' \describe{
#'  \item{Year}{Each year within the dataset}
#'  \item{Location}{Location of minimum precipitation date in Australia for each year}
#'  \item{Mean_rainfall}{The minimum rainfall for each year in the dataset}
#'  }


mean_rainfall = function(rain_data, location = "Brisbane"){

  rain_AUS_df <- rain_data %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    filter(Location == location) %>%
    group_by(year, Location) %>%
    summarise(mean_rainfall = mean(Rainfall, na.rm = TRUE))

  return(
    list(Location = location,
         Year = rain_AUS_df$year,
         Mean_rainfall = rain_AUS_df$mean_rainfall)
  )

}

max_rainfall = function(rain_data, location = "Brisbane", years = 2009:2017, month_spec = 4){

  rain_AUS_df <- rain_data %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    dplyr::filter(Location == location, year %in% years, month == month_spec) %>%
    dplyr::select(year, month, day, Rainfall)

  rain_array <- array(data = rain_AUS_df$Rainfall,
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
