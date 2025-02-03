
library(tidyverse)
library(ggplot2)
library(here) # here is like pwd but for the project
data_file <- here("toluca_company_data.csv")
file.exists(data_file)

# Step 1 - read in the data
toluca_data <- read_csv(data_file)

# Look at first 6 rows
head(toluca_data)

# Step 2 - Look for NaNs or extreme values
summary(toluca_data)

# Step 3 - Look for a linear relationship between the two variables
toluca_scatterplot <- toluca_data %>%
  ggplot(aes(x=Lot_Size, y=Work_Hours)) + # define our axes
  geom_point(color= "blue")

# Step 4 - Once a linear relationship is verified - write down the model + the matrix

# Calculating our beta hat

X <- cbind(1, toluca_data$Lot_Size) #column bind (stack columns side bys side)
dim(X) # sanity check

# X transpose X inverse
X_transpose <- t(X)
X_transpose_X <- X_transpose %*% X
X_transpose_X_inverse <- solve(X_transpose_X)

# 2 x2 
XtX_inv <- solve (t(X) %*% X)

#XtY
XtY <- t(X) %*% toluca_data$Work_Hours

XtX_inv %*% XtY

# using R's lm command
my_model <- lm(Work_Hours ~ Lot_Size, data = toluca_data)
my_model

#Coefficients:
#  (Intercept)     Lot_Size  
#       62.37         3.57  

beta_hat <- XtX_inv %*% XtY

# What is the expected number of work hours, for a Lot size of 80?
# () + () *()
# 62.365859.. + (3.57)*80
beta_hat[1] + beta_hat[2]*(80)
# Result: 347.982



  