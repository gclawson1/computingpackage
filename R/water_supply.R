#' water_supply
#'
#' A list that outputs for each year, for a specified location, whether the water supply is good, okay, or bad.
#' @param rain_data data frame with columns Date, Rainfall
#' @param location specified location in the data frame you want to see, default is Brisbane
#' @author Gage Clawson
#' @example water_supply(rain_data, location = "Woomera)
#' @return Returns a list containing,
#' \describe{
#'  \item{Year}{Each year within the dataset}
#'  \item{Location}{Location specified}
#'  \item{annual_rainfall}{Sum of the rainfall for a year}
#'  \item{Water_supply_level}{Whether or not the water supply is good, okay, or bad}
#'  }


water_supply = function(rain_data, location = "Brisbane"){

  rain_df <- rain_data %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    filter(Location == location) %>%
    group_by(year, Location) %>%
    summarise(sum_rainfall = sum(Rainfall, na.rm = TRUE)) %>%
    mutate(water_supply_level =
             case_when(
               sum_rainfall > 465 ~ "good",
               sum_rainfall < 465 & sum_rainfall > 300 ~ "okay",
               sum_rainfall < 300 ~ "poor"
             ))

   return(
    list(Location = location,
         Year = rain_df$year,
         annual_rainfall = rain_df$sum_rainfall,
         Water_supply_level = rain_df$water_supply_level)
  )



}
