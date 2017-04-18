rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

# excel_sheets("DataRepo.xlsx")
## Import data and create binary classes for target variables
data <- read_excel("DataRepo.xlsx", "EmployeeRetenion")
names(data)[6] <- "CollegeGrad"
alpha <- 0.05


years.eduY <- subset(data, CollegeGrad=="Y")[ ,1]
years.eduN <- subset(data, CollegeGrad=="N")[ ,1]
years.locY <- subset(data, Local=="Y")[ ,1]
years.locN <- subset(data, Local=="N")[ ,1]