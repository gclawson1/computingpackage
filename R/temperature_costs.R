temperature_costs <- when daily temperature > 40 => hospital_bill == temp*10 dollars

#' temperature_costs
#'
#' Compute the potential yearly hospital bill costs for people who might have a heat stroke at 3 PM in Australia over the span of the data set.
#'@param str data frame with columns Date, Temp3pm
#' @return returns a list containing,
#' \describe{
#'  \item{Year}{Each year within the dataset}
#'  \item{hospital_bill}{Sum of potential hospital bills from heat stroke}
#'  }

