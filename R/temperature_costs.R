temperature_costs <- when daily temperature > 40 => hospital_bill == temp*10 dollars, o.w. 0

#' temperature_costs
#'
#' Compute the potential yearly hospital bill costs for people who might have a heat stroke because of the maximum temperature for that day over the span of the data set.
#'@param str data frame with columns Date, MaxTemp
#' @return returns a list containing,
#' \describe{
#'  \item{Year}{Each year within the dataset}
#'  \item{hospital_bill}{Sum of potential hospital bills from heat stroke}
#'  }

temperature_costs <- function(data){

  climate_data <- rain_AUS %>%
    dplyr::mutate(year = lubridate::year(Date),
                  month = lubridate::month(Date),
                  day = lubridate::day(Date)) %>%
    mutate(hospital_bill = case_when(MaxTemp >= 40 ~ MaxTemp*10,
                                     MaxTemp < 40 ~ 0)) %>%
    group_by(year) %>%
    summarise(total_hospital_bills = sum(hospital_bill, na.rm = TRUE))

  return(list(Year = climate_data$year,
              sum_hospital_bills = climate_data$total_hospital_bills))
}
