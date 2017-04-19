rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)
library(reshape2)
library(car)

## Set working directory
# getwd() set to the project file when opened
# setwd(paste(getwd(), "/Regression", sep = ""))  # move into regression folder

## Import data and create binary classes for target variables
df <- read_excel("DataRegression.xlsx", "Engines")
names(df) <- c("Sample", "Time")

png("learningRate.png")
ggplot(df, aes(x = Sample, y = Time)) +
  geom_point(shape = 1) + geom_line() +
  geom_smooth(method = 'auto', se = F, show.legend = T) +
  geom_smooth(method = lm, se = F) +
  xlab("Sample Unit") + ylab("Time (min)") + ggtitle("Learning Rate")
dev.off()

