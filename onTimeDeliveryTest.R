rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)
library(xts)

# excel_sheets("DataRepo.xlsx")  # print worksheet names
df <- read_excel("DataRepo.xlsx", "OnTimeDelivery")

## Subset into two test set vectors
newSample <- c(df[which(as.Date(df$Month)>"2013-12-01"), which(names(df)=="Percent")])
oldSample <- c(df[which(as.Date(df$Month)<"2013-12-01"), which(names(df)=="Percent")])

## Sample size
n <- length(newSample)

## The sample and hypothesis mean
pbar <- mean(newSample)  # sample proportion mean
p0 <- mean(oldSample)  # hypothesized proportion mean

# Compute the t and z test scores since we know the variance
z <- (pbar - p0) / sqrt(p0 * (1 - p0) / n)  # Compute the z-test statistic

## Compute the p-value based on the z statistic
pval <- pnorm(z)
pval

## Do not reject that the mean fill rate for 2014 is higher than the mean fill rate since 2010.
