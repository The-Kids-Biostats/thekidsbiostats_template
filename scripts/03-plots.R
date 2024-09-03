#' 03-plots.R
#' 
#' The function(s) in this script should perform analysis and generate models.
#' 

generate_plots <- function(data) {
  plots <- list()
  
  plots$model1 <- ggplot(aes(x = wt_cat, y = mpg), data = data) + 
    geom_violin(aes(fill = wt_cat)) +
    theme_institute(fill_theme = "thekids")
  
  plots
}