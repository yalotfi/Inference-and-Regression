rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

# excel_sheets("DataRepo.xlsx")
## Import data subset into vectors representing the historical and new samples
data <- read_excel("DataRepo.xlsx", "Transmission")
current <- c(as.matrix(data[ ,1]))
process_A <- c(as.matrix(data[ ,2]))
process_B <- c(as.matrix(data[ ,3]))

## Sample size
n <- 30  # Size of both tests is 30

## Null Hypothesis 1 and 2: 
# There is no significant difference between the current
# process and either Process A (1) or Process B (2) i.e.
# the sample mean equals the hypothesized mean.

## Mean of both samples and the hypothesis
mu0 <- mean(current)  # Hypothesized mean
xbar_A <- mean(process_A)  # Sample mean for Test A
xbar_B <- mean(process_B)  # Sample mean for Test B

## StDev of populations for each test
sigma_A <- sd(c(as.matrix(data[ ,1:2])))
sigma_B <- sd(c(as.matrix(data[ ,c(1,3)])))

## Using z score since the sample size is 30 and the variance is known
z_A <- (xbar_A - mu0) / (sigma_A / sqrt(n))  # z-test statistic for Test A
z_B <- (xbar_B - mu0) / (sigma_B / sqrt(n))  # z-test statistic for Test B

## Compute the p-Value for both tests
pVal_A <- 2 * pt(z_A, df = n - 1)
pVal_B <- 2 * pt(z_B, df = n - 1)

# Both tests are well-beyond a significance value of 0.05, indicating that
# neither alternative process is better than the current one.