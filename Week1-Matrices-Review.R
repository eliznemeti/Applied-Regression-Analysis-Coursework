## Wed Jan 15 | Week 1 | BIOS507 | Emory ##


# Demonstratating centering matrix
N <- 4

# c means we're giving r an array of numbers
matrix(c(1,2,3,4)) # here we've given it no dimensional info, so it'll default to a 4x1 vector
matrix(c(1,2,3,4), nrow = 2, ncol = 2) #see now we've fiven the row and col info it makes the 2x2 matrix

# Create a matrix of ones
OnesMatrix <- matrix(1, nrow = N, ncol = N) # we're including the 1s matrix just to be explicit, don't need it in practice

# Create the centering matrix
c <- matrix ( diag(N) - (1/N) )

# Example 2 
test_scores <- c(1,2,3,4)
mean(test_scores) # 2.5 (can also calc in the console)

# Now let's center it
c %*% test_scores # we use %*%  for matrix multiplication

# Demonstrating innner product
x <- matrix(c(1,5,7,11), ncol = 1) # dimension of x is 4x1
y <- matrix(c(4,6,4,14), ncol = 1) # dimension of y is also 4x1

x + y

# now we need to transpose to get our scalar
t(x) %*% y # t is for transpose








