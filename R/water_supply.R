#' water_supply
#'
#' A list that outputs for each year, for a specified location, whether the water supply is good, okay, or bad.
#' @param rain_data data frame with columns Date, Location, Rainfall
#' @param location specified location in the data frame you want to see, default is Brisbane
#' @param plot_out specify if you want a plot proudced, default is FALSE
#' @author Gage Clawson
#' @example water_supply(rain_data, location = "Woomera)
#' @return Returns a list containing,
#' \describe{
#'  \item{Year}{Each year within the dataset}
#'  \item{Location}{Location specified}
#'  \item{annual_rainfall}{Sum of the rainfall for a year}
#'  \item{Water_supply_level}{Whether or not the water supply is good, okay, or bad}
#'  \plot{Annual Rainfall Plot}{Shows a plot of annual rainfall in a specified location}
#'  }


water_supply = function(rain_data, location = "Brisbane", plot_out = FALSE){

  rain_df <- rain_data %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    filter(Location == location) %>%
    group_by(year, Location) %>%
    summarise(annual_rainfall = sum(Rainfall, na.rm = TRUE)) %>%
    mutate(water_supply_level =
             case_when(
               annual_rainfall > 465 ~ "good",
               annual_rainfall < 465 & annual_rainfall > 300 ~ "okay",
               annual_rainfall < 300 ~ "poor"
             )) %>%
    ungroup()

  if(plot_out){
    plot <- ggplot(rain_df, aes(x = as.factor(year), y = annual_rainfall)) + geom_col(aes(fill = water_supply_level)) + labs(title = sprintf("Annual Rainfall in %s", location), x = "Year", y = "Annual Rainfall") + theme_classic() +
#      scale_x_continuous(expand = c(0,0)) +
      scale_y_continuous(expand = c(0,0)) +
      scale_fill_discrete(name = "Water Supply Status") +
      theme(axis.text.x = element_text(angle = -45, hjust = 1))

  }

   return(
list(
     table = rain_df,
     plot = plot
  ))



}
