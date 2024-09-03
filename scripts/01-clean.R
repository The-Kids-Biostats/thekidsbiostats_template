#' 01-clean.R
#' 
#' The function(s) in this script should process the raw data into data ready
#' for analysis, tabulation and plotting
#' 

clean <- function(file) {
  
  data_raw <- read.csv(file)
  
  data <- data_raw %>%
    mutate(wt_cat = case_when(
      wt < 3 ~ "Light",
      wt < 4 ~ "Medium",
      wt >= 4 ~ "Heavy",
      TRUE ~ as.character(NA)
    ))
  
  data
}