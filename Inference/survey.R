rm(list = ls())

# install.packages("readxl", dependencies = T)
library(readxl)

# excel_sheets("DataRepo.xlsx")
survey <- read_excel("DataRepo.xlsx", "CustomerSurvey2014")
survey <- survey[ ,-1]
vector <- c(as.matrix(survey[ ,1:4]))
groups <- factor(rep(c("quality","easeOfUse","price","service"), each = 200))

## Test for Homoskedasticity
bartlett <- bartlett.test(vector, groups)
fligner <- fligner.test(vector, groups)
chi_sq_test <- qchisq(0.950, 3)

# There are significant differences between the variables because
# we do reject the null hypothesis.
