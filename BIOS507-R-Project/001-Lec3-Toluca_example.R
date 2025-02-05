# SBP Example

#install.packages("tidyverse")
library(tidyverse) # reads in key functions

# read_csv vs read.csv, "." will be base R so you wont get extra info like tibble, and datatype info
SBP_data <- read.csv("/Users/elizabethnemeti/Documents/GitHub/BIOS507-Coursework/SBPexample/SBP_LDL_dataset.csv") # load in data
SBP_data

# We want to use SPB to predict LDL, so:
# LDLi = ß0 + ß1 x SßPi + Ei -> we want to make this a model matrix in R, so:

N <- nrow(SBP_data) # count how many rows, could also hardcode it as 14

intercept <- matrix(rep(1, N), nrow = N, ncol = 1,) # create intercept column

SBP <- SBP_data$SBP # $ is for selecting a specific column from the data
# alternative to "$" is SBP_data %>% pull (SBP) for better readability

# have intercept and SBP, ready to create model matrix
X <- cbind(intercept, SBP) # cbind - "column bind", stacks all data as columns

# Obtain least squares estimates
beta_hat <- solve( t(X) %*% X ) %*% t(X) %*% SBP_data$LDL # "solve" is inverse
beta_hat # we get a 2x1 matrix as expected

# What is the estimate for beta 0?
# What is the estimate of B1/ the slope for systolic blood pressure?
# for a 1 unit increase in ...


# Plotting---

#install.packages("ggplot2")
library(ggplot2)

SBP_LDL_scatter <- SBP_data %>%
  ggplot( aes(x = SBP, y = LDL)) +
  geom_point()

SBP_LDL_scatter + geom_abline(intercept = 27.156, slope = 1.017)





