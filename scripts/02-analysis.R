#' 02-analysis.R
#' 
#' The function(s) in this script should perform analysis and generate models.
#' 

run_models <- function(data) {
  models <- list()
  
  models$model1 <- lm(mpg ~ wt_cat, data = data)
  
  models
}