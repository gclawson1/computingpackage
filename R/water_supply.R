when yearly precipitation > 465 => water supply good, when yearly precipitation < 465, > 300 => water supply okay, when yearly precipitation <=300  => water supply bad

#' water_supply
#'
#' A list that outputs for each year, whether the water supply is good, okay, or bad.
#'@param str data frame with columns Date, Rainfall
#' @return returns a list containing,
#' \describe{
#'  \item{Year}{Each year within the dataset}
#'  \item{water_supply_level}{Whether or not the water supply is good, okay, or bad}
#'  }
