### BIOS507 Spring 2025 | Dr Lukemire | Elizabeth Nemeti
###  Due: February 3 2025

# use c() for vectors
x1 <- c(1,3,5,7)
x2 <- c(-1,2,9,3)
print(x1)
print(x2)

# Step 1: Compute covariance

# use cov() function to calculate the covariance between two data frames or vectors
covariance <- (cov(x1, x2)) 
print(covariance)

# R defaults to calculating sample covariance (6.33) 
# To also get population covariance (4.75), we could do:

n <- 4 
population_covariance <- (n-1)/n*covariance
print(population_covariance)

