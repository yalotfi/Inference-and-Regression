rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

## Set working directory
# getwd() set to the project file
setwd(paste(getwd(), "/Inference/EmployeeRetention", sep = ""))

## Import data and create binary classes for target variables
data <- read_excel("../DataRepo.xlsx", "EmployeeRetenion")
alpha <- 0.05

## Null Hypothesis:
## Mean years at PLE for local employees to mean years at PLE for remote employees

## Create Vectors
years.locY <- subset(data, Local=="Y")[ ,1]
years.locN <- subset(data, Local=="N")[ ,1]

## Compute params
n <- length(years.locY)  # Sample size
mu.locY <- mean(years.locY)  # Sample mean
mu.locN <- mean(years.locN)  # Hypothesized mean
s.locY <- sd(years.locY)  # Sample StDev

## T-Stats
t.local <- (mu.locY - mu.locN) / (s.locY / sqrt(n))
t.half.alpha <- qt(1 - alpha / 2, df = n - 1)

## Test Hypothesis with Critical Values and P-Value
criticalVals <- c(-t.half.alpha, t.half.alpha)
pVal.local <- 2 * pt(t.local, df = n - 1)

## Should we Reject?
t.local < criticalVals[1] || t.local > criticalVals[2]  # TRUE
pVal.local <= alpha  # FALSE

## Conclusion:
## Both solutions verify that the null hypothesis cannot be rejected
