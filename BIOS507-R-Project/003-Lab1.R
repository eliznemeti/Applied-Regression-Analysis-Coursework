## Lab 1: Simple Linear Regression Review 01
## Feb 17

library(tidyverse)
library(ggplot2)
library(patchwork) # for plotting side by side

#### Data Loading ####

data_path = "/Users/elizabethnemeti/Documents/GitHub/BIOS507-Coursework/BIOS507-R-Project/"
data_file <- file.path(data_path, "SBP_LDL_dataset.csv")

sbp_ldl_data <-read_csv(data_file)

# check everything looks okay
summary(sbp_ldl_data)

#### Checking Assumptions ####

# What should we do before fitting the model?
# Check whether linear relationship is an appropriate function via a scatter plot
SBP_LDL_scatterplot <- sbp_ldl_data %>%
  ggplot(aes(x = SBP, y = LDL)) + 
  theme_minimal(base_size = 10) + # makes it a clean white background
  geom_point() # makes it a scatterplot

SBP_LDL_scatterplot

# Does a linear relationship appear appropriate?
# Yes. Now we are ready to start fitting our model. We can start by writing down the assumed regression model.

# Write down the model in terms of a general Y (aka not expectation of Y)
# Y = ß0 + ß1X + E
# LDL is Y, SBP is X

# Write down the model in terms of the expectation of Y
# E[Y] = ß0 + ß1X (the error term is gone because we're looking at population not individual)

# What do we assume about the variance of E?

# What do we assume about the dependence/independence of the observations?
# Observations are independent.

# What do we assume about the distribution of the Y terms?
# They are normally distributed.

# What do we allow to be different about the distributions about Yi and Yj (two random people from the population)?
# The mean - what makes their means different is they depend on SBP.

#### Fitting the Model ####

# In order to estimate the model parameters using matrix operations, what matrix do I need to construct?

# What are the matrix dimensions and why?
#14x2

# Let's create the matrix
X <- cbind(1, sbp_ldl_data$SBP)

# Separate matrix for Y, let's create the outcome variables
Y <- sbp_ldl_data$LDL

# I want ßhat, how do I get 
#(X'X)-1 

sbp_ldl_model <- lm (LDL ~ SBP, data = sbp_ldl_data)
sbp_ldl_model
summary(sbp_ldl_model)

#Coefficients:
#  (Intercept)          SBP  
#       27.157        1.017  

# What is the estimate for the intercept?
27.157

# What is the estimate of the slope?
ß1hat = 1.0168

# Construct the test statistic using the information in the summary.
# 

# We decide N = 2 from our dimension earlier (14x2), we can do this because it's SIMPLE linear regression

test_statistic = (1.068 - 0) 






