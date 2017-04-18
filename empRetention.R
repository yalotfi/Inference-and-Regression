rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

# excel_sheets("DataRepo.xlsx")
## Import data and create binary classes for target variables
data <- read_excel("DataRepo.xlsx", "EmployeeRetenion")
data$gender_bin <- ifelse(data$Gender == "F", 1, 0)
data$grad_bin <- ifelse(data$'College Grad' == "Y", 1, 0)
data$local_bin <- ifelse(data$Local == "Y", 1, 0)

## Vectorize for hypothesis testing
yearsPLE <- c(as.matrix(data[ ,1]))
gender_bin <- c(as.matrix(data[ ,8]))
grad_bin <- c(as.matrix(data[ ,9]))
local_bin <- c(as.matrix(data[ ,10]))

## Homoscedasticity Tests and ANOVA:
vector <- c(as.matrix(data[ ,c(1,8:10)]))
groups <- factor(rep(c("years","gender","grad","local"), each = 40))
bartlett <- bartlett.test(vector, groups)
fligner <- fligner.test(vector, groups)
chi_sq_test <- qchisq(0.950, 3)

fit <- lm(formula = vector ~ groups)
anova(fit)

## Compute target means
mu0 <- mean(yearsPLE)
xbar_gender <- mean(gender_bin)
xbar_grad <- mean(grad_bin)
xbar_local <- mean(local_bin)
n <- 40  # Sample size is always 40

## Compute target Population StDev
sigma_gender <- sd(c(as.matrix(data[ ,c(1,8)])))
sigma_grad <- sd(c(as.matrix(data[ ,c(1,9)])))
sigma_local <- sd(c(as.matrix(data[ ,c(1,10)])))

## Compute z-scores
z_gender <- (xbar_gender - mu0) / (sigma_gender / sqrt(n))  # z-test statistic for gender test
z_grad <- (xbar_grad - mu0) / (sigma_grad / sqrt(n))  # z-test statistic for grad test
z_local <- (xbar_local - mu0) / (sigma_local / sqrt(n))  # z-test statistic for local test

## Compute p-values
pVal_gender <- 2 * pt(z_gender, df = n - 1)
pVal_grad <- 2 * pt(z_grad, df = n - 1)
pVal_local <- 2 * pt(z_local, df = n - 1)

## There are significant differences in employee retention due to all three target variables