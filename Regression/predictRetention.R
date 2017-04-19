rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)
library(reshape2)
library(car)

## Set working directory
# getwd() set to the project file when opened
# setwd(paste(getwd(), "/Regression", sep = ""))  # move into regression folder

## Import data and create binary classes for target variables
df <- read_excel("DataRegression.xlsx", "EmployeeRetenion")
df <- df[ ,1:4]
names(df)[3] <- "GPA" 
## Run Descriptive Stats
## Check missing values, out of range values, and categorical variables
summary(df)

## Generate Histograms for Continuous Variables
png("histRetention.png")
ggplot(melt(df[ ,2:ncol(df)]), aes(x = value)) + 
  facet_wrap(~ variable, scales = "free", ncol = 2) + 
  geom_histogram(binwidth = .5)
dev.off()

## Create scatter plots between predicted variable and predictors (DV and IVs)
png("scatterMatrixRetention.png")
pairs(~YearsPLE+YrsEducation+GPA+Age, data = df, main = "Scatter Plot Matrix")
dev.off()

## Run Regression
fit <- lm(YearsPLE ~ YrsEducation + GPA + Age, data = df)

## Assess Regression
summary(fit)
anova(fit)
vif(fit)

png("diagnosticPlots.png")
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit)
layout(matrix(c(1,1)))
dev.off()

## Re-create the model
fit <- lm(YearsPLE ~ Age, data = df)
summary(fit)
anova(fit)

png("finalDiagnostic.png")
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit)
layout(matrix(c(1,1)))
dev.off()
