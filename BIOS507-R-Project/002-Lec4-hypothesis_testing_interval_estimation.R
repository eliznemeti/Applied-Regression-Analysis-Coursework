## Hypothesis Testing and Interval Estimation (Lecture 4)
## Feb 3-5


## Slide 21/53
# Getting the critical value from a t-distribution for a two sided test with alpha 0.05 and 38 degrees of freedom
alpha <- 0.05
qt(1-alpha/2, df =38) # why alpha/2? bc it's a two tailed test, also 38 is arbitrary
qnorm(1-alpha/2)
# 1.959964

# Getting the critical value from a t-distribution for a two sided test with alpha 0.01 and 20 degrees of freedom
alpha <- 0.01
qt(1-alpha/2, df=20)
# 2.84534

## Slide 26/53
#Getting the critical value for the Toluca example
alpha <- 0.05
qt(1-alpha/2, df = 25-2)

