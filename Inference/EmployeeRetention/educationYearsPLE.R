rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

## Set working directory
# getwd() set to the project file
setwd(paste(getwd(), "/Inference/EmployeeRetention", sep = ""))

## Import data and create binary classes for target variables
data <- read_excel("../DataRepo.xlsx", "EmployeeRetenion")
names(data)[6] <- "CollegeGrad"
alpha <- 0.05

## Null Hypothesis:
# The mean years at PLE for college grads is equal to the mean years
# at PLE for non-college grads.

## Create Vectors
years.eduY <- subset(data, CollegeGrad=="Y")[ ,1]
years.eduN <- subset(data, CollegeGrad=="N")[ ,1]

## Compute T-stat paramters
n <- length(years.eduY)  # Sample size
mu.edyY <- mean(years.eduY)  # Sample mean
mu.eduN <- mean(years.eduN)  # Hypothesized mean
s.eduY <- sd(years.eduY)  # Sample StDev

## T-Stats
t.grad <- (mu.edyY - mu.eduN) / (s.eduY / sqrt(n))
t.half.alpha <- qt(1 - alpha / 2, df = n - 1)

## Test Hypothesis with Critical Values and P-Value
criticalVals <- c(-t.half.alpha, t.half.alpha)
pVal.grad <- 2 * pt(t.grad, df = n - 1)

## Should we Reject?
t.grad < criticalVals[1] || t.grad > criticalVals[2]  # TRUE
pVal.grad <= alpha  # TRUE

## Conclusion:
## Both solutions verify that the null hypothesis cannot be rejected
