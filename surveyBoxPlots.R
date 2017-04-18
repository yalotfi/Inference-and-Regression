rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)
library(ggplot2)
library(gridExtra)

# excel_sheets("DataRepo.xlsx")
survey <- read_excel("DataRepo.xlsx", "CustomerSurvey2014")
survey$Region <- as.factor(x = survey$Region)
colnames(survey)[3] <- "EaseOfUse"

box.quality <- ggplot(survey, aes(x = Region, y = Quality)) +
  geom_boxplot(fill = "grey80", colour = "blue") +
  scale_x_discrete() + xlab("Market Regions") +
  ylab("Responses to Quality") +
  ggtitle("Quality")

box.ease <- ggplot(survey, aes(x = Region, y = EaseOfUse)) +
  geom_boxplot(fill = "grey80", colour = "blue") +
  scale_x_discrete() + xlab("Market Regions") +
  ylab("Responses to Ease of Use") +
  ggtitle("Ease of Use")

box.price <- ggplot(survey, aes(x = Region, y = Price)) +
  geom_boxplot(fill = "grey80", colour = "blue") +
  scale_x_discrete() + xlab("Market Regions") +
  ylab("Responses to Quality") +
  ggtitle("Price")

box.service <- ggplot(survey, aes(x = Region, y = Service)) +
  geom_boxplot(fill = "grey80", colour = "blue") +
  scale_x_discrete() + xlab("Market Regions") +
  ylab("Responses to Service") +
  ggtitle("Service")

png("boxPlots.png")
grid.arrange(box.quality, box.ease, box.price, box.service, ncol = 2)
dev.off()
