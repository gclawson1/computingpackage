#' temp_risks
#'
#' Compute the number of days per each location over the span of the data set where there is risk of heat stroke, comfortable weather, and freezing at 3 PM.
#' @param data data frame with columns Date, Location, Temp3pm
#' @author Gage Clawson
#' @example temp_risks(data)
#' @return Returns a table containing,
#' \describe{
#'  \item{Location}{Location in Australia}
#'  \item{heat_stroke_n}{Number of days for a particular location where there has been a risk of heat stroke}
#'  \item{comfort_n}{Number of days for a particular location where the weather has been comfortable}
#'  \item{freezing_n}{Number of days for a particular location where there has been a risk of freezing}
#'  }


temp_risks = function(data){

  clim_df <- data %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    mutate(risk = case_when(
      Temp3pm >40 ~ "heat stroke",
      Temp3pm < 40 & Temp3pm >= 0 ~ "comfortable",
      Temp3pm < 0 ~ "freezing"
    ) )
    risk_df <- clim_df %>%
      group_by(Location) %>%
    summarise(heat_stroke_n = sum(risk == "heat stroke", na.rm = TRUE),
              comfortable_n = sum(risk == "comfortable", na.rm = TRUE),
              freezing_n = sum(risk == "freezing", na.rm = TRUE)) %>%
      ungroup()

  return(list(table = risk_df)
  )



}
