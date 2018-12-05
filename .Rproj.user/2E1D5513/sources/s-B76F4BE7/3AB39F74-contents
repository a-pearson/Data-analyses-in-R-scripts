# making a function
#
#
#
# the function() function provides a wrapper to perform a specific task
# here we will draw a (standard) normal curve based and the mean and sd
# that we provide to the function

d.t <- runif(134, -2, 88)
d.t.simple <- c(2,4)

source("custom.functions.R")

f.mean <- function(vector.of.data, n){
  mean.thor <- sum(vector.of.data) / length(vector.of.data)
  mean.thor.n <- mean.thor * n
  return(mean.thor.n)
}
f.mean()

f.mean(d.t.simple, 10)

