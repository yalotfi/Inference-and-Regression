rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

# excel_sheets("DataRepo.xlsx")
## Import data subset into vectors representing the historical and new samples
data <- read_excel("DataRepo.xlsx", "Defects")
oldSample <- c(as.matrix(data[ ,2:5]))
newSample <- c(as.matrix(data[ ,6]))
n <- length(newSample)

## Compute sample and hypothesized means
xbar <- mean(newSample)  # sample mean
mu0 <- mean(oldSample)  # hypothesized mean

## The sample and population standard deviations
s <- sd(newSample)  # sample stdev
sigma <- sd(c(as.matrix(data[ ,2:6])))  # population stdev

## Compute the t and z test scores since we know the variance
z <- (xbar - mu0) / (sigma / sqrt(n))  # Compute the z-test statistic
t <- (xbar - mu0) / (s / sqrt(n))  # Compute the t-test statistic

## Known population standard deviation BUT sample size is below 30 observations
# Use t-score:
pval_t <- pt(t, df = n - 1, lower.tail = F)  # Compute the p-value based on t
pval_z <- pt(z, df = n - 1, lower.tail = F)  # Compute the p-value based on z

## Critical Value
alpha <- 0.05
t.alpha <- qt(1 - alpha, df = n - 1)

## Do not reject the hypothesis bc t < t.alpha

## Conclusion:
# Hypothesizing that the mean defect count is less than the
# historical mean we find that this indeed probable given
# a 0.05 significance level

