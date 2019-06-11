When daily temp > 40 => “risk of heat stroke”, when daily precipitation < 40, >= 0 => “comfortable weather!”, when daily precipitation < 0 => “risk of hypothermia”

#' temp_risks
#'
#' compute the number of days in Australia per each location over the span of the data set where there is risk of heat stroke at 3 PM, comfortable weather, and hypothermia based.
#'@param str data frame with columns date, location, Temp3pm
#' @return returns a list containing,
#' \describe{
#'  \item{Location}{Location in Australia}
#'  \item{heat_stroke_n}{Number of days for a particular location where there has been a risk of heat stroke}
#'  \item{comfort_n}{Number of days for a particular location where the weather has been comfortable}
#'  \item{hypo_n}{Number of days for a particular location where there has been a risk of hypothermia}
#'  }
