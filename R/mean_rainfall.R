#' mean_rainfall
#'
#' Compute mean precipitation for all years in the dataset and a specified location and output that year, location, and precipitation level.
#' @param rain_data data frame with columns Date, Location, and Rainfall
#' @param location specified location in the data frame you want to see, default is Brisbane
#' @author Gage Clawson
#' @example mean_rainfall(rain_data, location = "Woomera")
#' @return Returns a list containing,
#' \describe{
#'  \item{Year}{Each year within the dataset}
#'  \item{Location}{Location specified}
#'  \item{Mean_rainfall}{The mean rainfall (mm) for each year in the dataset}
#'  }


mean_rainfall = function(rain_data, location = "Brisbane"){

  rain_df <- rain_data %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    filter(Location == location) %>%
    group_by(year, Location) %>%
    summarise(mean_rainfall = mean(Rainfall, na.rm = TRUE))

  return(
    list(Location = location,
         Year = rain_df$year,
         Mean_rainfall = rain_df$mean_rainfall)
  )

}


