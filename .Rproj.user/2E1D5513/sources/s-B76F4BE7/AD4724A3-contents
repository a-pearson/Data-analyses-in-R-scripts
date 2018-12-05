#
# for() loop example
#

# a simple example 
for(cntr in 1:10){
  # do something
  if(cntr^2 > 25){
    print(cntr^2)
  }
}

# build in data set iris
head(iris)
str(iris)

# let's take the sum of each of the first four columns
apply(iris[,1:4], 2, sum)

# make a selection of the iris columns we want to use
d <- iris[,1:4]
head(d)
length(d)
ncol(d)
# make  a vector to store the sum values
sum.stored <- rep(NA, ncol(d))
range(d)

# made up explanatory varoable with same length as entries in d
expl.var <- c(1:nrow(d))

# make an empty plot but usig NA as you your data input
# hoever, you got to set the axis range manually
# as we made up the expl.var, we know its range
# the range for the y axis we can get using range()
plot(NA, xlim = c(0,150), ylim = range(d))
# we like each group (four in total) to have their own colour
# in the chart.
colour.thor <- c("blue", "red", "purple", "green")

# make a loop. Start at counter 1 and end at the number of columns in 
# data fraem d
for(i in 1:ncol(d)){
  
  print(i)  # printer the counter (i) value so we know where we are
  # i <- 1
  d.t <- d[,i]  # select the colun we want to use
  class(d.t)  # what class is this? Just to check
  sum.stored[i] <- sum(d.t)  # calculate the sum and store it in the 
  #ith element of the vector sum.stored
  print(sum.t)  #print the sum value
  # print the selected value (d.t.) on the plot area usig pooints() 
  points(expl.var,d.t, pch = 19, col=colour.thor[i])
  # do a regression, store the model output and print it to the plot
  # as a line using abline()
  m.t <- lm(d.t ~ expl.var)
  str(m.t)
  abline(m.t, col=colour.thor[i])
  # end of the i-th round
}
getwd()  # path to working directory, just to check
# write an R objetc as .csv file
write.csv(sum.stored,"whateverman.csv")


