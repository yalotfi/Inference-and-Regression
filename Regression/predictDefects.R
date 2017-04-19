rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)
library(ggplot2)

## Set working directory
# getwd() set to the project file when opened
# setwd(paste(getwd(), "/Regression", sep = ""))  # move into regression folder

## Import data and create binary classes for target variables
df <- read_excel("DataRegression.xlsx", "Defects")
df$MonthID <- seq(1,12,1)
names(df) <- c("MonthName", "y2010", "y2011", "y2012", "y2013", "y2014", "MonthID")
df$MonthName <- as.factor(df$MonthName)

## Trendlines
png("DefectPlot.png", width = 720, height = 480)
ggplot(df, aes(x = MonthID, y = y2010)) +
  geom_point(shape = 1) + geom_line() +
  geom_smooth(method = lm) +
  xlab("Month") + ylab("Defect Counts") + ggtitle("Defects in 2010")
dev.off()

## Regression line as follows:
# y = 1.4056x + 817.2 and R^2 = 0.1898
