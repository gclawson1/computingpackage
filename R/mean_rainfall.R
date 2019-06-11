#' mean_rainfall
#'
#' Compute mean daily precipitation for all years in the dataset and a specified location and output that year, location, and precipitation level.
#' @param rain_data data frame with columns Date, Location, and Rainfall
#' @param location specified location in the data frame you want to see, default is Brisbane
#' @author Gage Clawson
#' @example mean_rainfall(rain_data, location = "Woomera")
#' @return Returns a list containing,
#' \describe{
#'  \item{Year}{Each year within the dataset}
#'  \item{Location}{Location specified}
#'  \item{Mean_rainfall}{The mean daily rainfall (mm) for each year in the dataset}
#'  \plot{Plot of mean rainfall}{Shows a plot of mean daily rainfall in a specified location}
#'  }


mean_rainfall = function(rain_data, location = "Brisbane", plot_out = FALSE){

  rain_df <- rain_data %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    filter(Location == location) %>%
    group_by(year, Location) %>%
    summarise(mean_rainfall = mean(Rainfall, na.rm = TRUE))

  if(plot_out){
    plot <- ggplot(rain_df, aes(x = as.factor(year), y = mean_rainfall)) + geom_col() + labs(title = sprintf("Mean Annual Rainfall in %s", location), x = "Year", y = "Mean Rainfall") + theme_classic() +
      #      scale_x_continuous(expand = c(0,0)) +
      scale_y_continuous(expand = c(0,0)) +
      theme(axis.text.x = element_text(angle = -45, hjust = 1))

  }

  return(
    list(
     rain_table = rain_df,
      plot = plot
    ))
}


