#' _targets.R
#' 
#' This is the main targets script which operates and defines the analysis
#' pipeline. Each of the R scripts is sourced, which should contains functions
#' to perform the various tasks of analysis.
#' 
#' The list of targets defines the steps of analysis, where the first argument 
#' of each target is the output required of that step, and the second argument
#' is the function (defined in our scripts somewhere) with input parameters. If
#' these input parameters match output parameters of other items in the list,
#' a dependency is formed. 
#' 
#' To view the network, run targets::tar_visnetwork(targets_only = T)
#' 
#' To run the pipeline, use targets::tar_make()

library(targets)
library(tarchetypes)

file_names <- list.files(path = "scripts", pattern = "\\.R$")
lapply(paste0("scripts/", file_names), source)

# Package dependencies here
tar_option_set(packages = c("tidyverse", "kableExtra", "biometrics"))

write.csv(mtcars, "data_raw/mtcars.csv")

list(
  # Read data
  tar_target(file, "data_raw/mtcars.csv", format = "file"),
  
  # Clean data
  tar_target(data_cleaned, clean(file)),
  
  # Produce output
  tar_target(models, run_models(data_cleaned)),
  tar_target(plots, generate_plots(data_cleaned)),
  
  # Render report
  tar_quarto(report, path = "reports/template.qmd", quiet = FALSE)
)
