rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

# excel_sheets("DataRepo.xlsx")
## Import data and create binary classes for target variables
data <- read_excel("DataRepo.xlsx", "EmployeeRetenion")
alpha <- 0.05

## Null Hypothesis:
## Mean years at PLE of male employees equal to mean years at PLE of female employees

## Create vectors of data to compare 
years.m <- subset(data, Gender=="M")[ ,1]
years.f <- subset(data, Gender=="F")[ ,1]

## Compute T-stat paramters
n <- length(years.m)  # Sample size
mu.m <- mean(years.m)  # Sample mean
mu.f <- mean(years.f)  # Hypothesized mean
s.m <- sd(years.m)  # Sample StDev

## T-Stats
t.gender <- (mu.m - mu.f) / (s.m / sqrt(n))
t.half.alpha <- qt(1 - alpha / 2, df = n - 1)

## Test Hypothesis with Critical Values and P-Value
criticalVals <- c(-t.half.alpha, t.half.alpha)
pVal.gender <- 2 * pt(t.gender, df = n - 1)

t.gender > criticalVals[1] & t.gender < criticalVals[2]  # TRUE
pVal.gender >= alpha  # TRUE

## Conclusion:
## Both solutions verify that the null hypothesis cannot be rejected
