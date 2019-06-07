#' Climate Data from Australia
#'
#' Observations were drawn from numerous weather stations. The daily observations are available from http://www.bom.gov.au/climate/data. Copyright Commonwealth of Australia 2010, Bureau of Meteorology.
#' Data were downloaded from Kaggle. https://www.kaggle.com/jsphyg/weather-dataset-rattle-package/
#'
#' @format A data frame with 142193 rows and 24 columns
#' \itemize{
#' \item date year/month/dat
#' \item location The common name of the location of the weather station
#' \item MinTemp The minimum temperature in degrees celsius
#' \item MaxTemp The maximum temperature in degrees celsius
#' \item Rainfall The amount of rainfall recorded for the day in mm
#' \item Evaporation The so-called Class A pan evaporation (mm) in the 24 hours to 9am
#' \item Sunshine The number of hours of bright sunshine in the day.
#' \item WindGustDir The direction of the strongest wind gust in the 24 hours to midnight
#' \item WindGustSpeed The speed (km/h) of the strongest wind gust in the 24 hours to midnight
#' \item WindDir9am Direction of the wind at 9am
#' \item WindDir3pm Direction of the wind at 3pm
#' \item WindSpeed9am Wind speed (km/hr) averaged over 10 minutes prior to 9am
#' \item WindSpeed3pm Wind speed (km/hr) averaged over 10 minutes prior to 3pm
#' \item Humidity9am Humidity (percent) at 9am
#' \item Humidity3pm Humidity (percent) at 3pm
#' \item Pressure9am Atmospheric pressure (hpa) reduced to mean sea level at 9am
#' \item Pressure3pm Atmospheric pressure (hpa) reduced to mean sea level at 3pm
#' \item Cloud9am Fraction of sky obscured by cloud at 9am. This is measured in "oktas", which are a unit of eigths. It records how many
#' \item Cloud3pm Fraction of sky obscured by cloud at 3pm. This is measured in "oktas", which are a unit of eigths. It records how many
#' \item Temp9am Temperature (degrees C) at 9am
#' \item Temp3pm Temperature (degrees C) at 3pm
#' \item RainToday Boolean: 1 if precipitation (mm) in the 24 hours to 9am exceeds 1mm, otherwise 0
#' \item RISK_MM The amount of next day rain in mm. Used to create response variable RainTomorrow. A kind of measure of the "risk".
#' \item RainTomorrow The target variable. Did it rain tomorrow?
#'
#' }
#' @source \url{http://sbs.lternet.edu/data/}
#' @author Naomi
"rain_AUS"
