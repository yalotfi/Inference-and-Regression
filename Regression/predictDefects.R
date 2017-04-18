rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

## Set working directory
# getwd() set to the project file when opened
# setwd(paste(getwd(), "/Regression", sep = ""))  # move into regression folder

## Import data and create binary classes for target variables
data <- read_excel("DataRegression.xlsx", "Defects")

## Run Descriptive Stats
## Check missing values, out of range values, and categorical variables

## Generate Histograms for Continuous Variables

## Create scatter plots between predicted variable and predictors (DV and IVs)

## Run Regression

## Assess Regression

## Re-create the model