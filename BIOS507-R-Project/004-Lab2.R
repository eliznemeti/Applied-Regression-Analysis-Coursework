## Lab 2: Simple Linear Regression Review 02
## Feb 19

library(tidyverse)
library(ggplot2)

#### Data Loading ####
data_path = "/Users/elizabethnemeti/Documents/GitHub/BIOS507-Coursework/BIOS507-R-Project/"
data_file <- file.path(data_path, "chatterton_construction.csv")
cc_data <- read_csv(data_file)

# Rows: 60 Columns: 4   

# check everything looks okay
summary(cc_data)

#### Checking Assumptions ####

# What should we do before fitting the model?
# Check whether linear relationship is an appropriate function via a scatter plot
sqft_cost_scatterplot <- cc_data %>%
  ggplot(aes(x = home_sqft, y = framing_cost)) +
  theme_minimal(base_size = 10) + # just some formatting
  geom_point() + 
  xlab("Size of the home (Sqft)") +
  ylab("Total Framing Cost (dollars)")

sqft_cost_scatterplot

# Does a linear relationship appear appropriate?
# Yes. Now we are ready to start fitting our model. We can start by writing down the assumed regression model.

# Write down the model in terms of a general Y (aka not expectation of Y)
# Y = ß0 + ß1X + E
# LDL is Y, SBP is X

# Write down the model in terms of the expectation of Y
# E[Y] = ß0 + ß1X (the error term is gone because we're looking at population not individual)

# Now we can use the lm command to fit the model
sqft_cost_model <- lm(framing_cost ~ home_sqft, data = cc_data)

summary(sqft_cost_model)

# What is the estimate for the intercept?

# Is the intercept meaningful here? No, because there wouldn't be a 0 sqft house. 

# What is the estimate for the slope?
# 6.665

#What is the interpretation of the estimate for the slope?
# For each sq ft increase in the house, the cost increases by 6.665 to frame the house.

# Next, let’s think about testing the association between house size and cost to frame the house.
# What should the null and alternative hypothesis be?

# H0: ß1 = 0
# HA: ß10 = 0

# What quantities do we need to construct the test statistic?
summary(sqft_cost_model) # let's call back our summary

# The estimate is ßhat1 = 6.665, the standard error is 0.8582. Test statistic is therefore given by (0.665-0)/0.8582

# What do we need to compare this to in order to assess significance?
# A critical value from a reference distribution. What is our reference distribution going to be? A distribution where n = 2.
  
# Use the qt function to obtain the critical value
critical_value <- qt(1.0 - 0.05/2, df = nrow(cc_data) - 2) #1.0 - 0.05/2 this is what gives us the two-tailed test
critical_value

# 2.001717

#What should our decision be?
# Because our observed test statistic was more extreme than our critical value, we reject the null hypothesis. 

# Next, I want to obtain the corresponding p-value for this test.
# This is a way of extracting the point estimate and
# the standard error without requiring us to write type them
# in manually
point_estimate <- sqft_cost_model$coefficients["home_sqft"]
se_hat <- summary(sqft_cost_model)$coefficients["home_sqft", "Std. Error"]

# Calculate the test statistic
test_statistic = (point_estimate - 0) / se_hat

# Multiply by 2 because doing a two-sided test
pt(test_statistic, df = nrow(cc_data) - 2, lower.tail = FALSE) * 2




