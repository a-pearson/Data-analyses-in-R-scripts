#
# relationships between two numerical variables.
#
# correlation. Measuring the covariance between two variables
# There is no explanatory and response variable
# sample parameters
n <- 10  #sample size
mean.t <- c(0, 0) # vector with means for the two variables
sd.t <- c(1, 0.2) # vector with sd for the two variables

# making the variables
var <- c(1:n) # generic variable
y.noise <- rnorm(n,mean.t[1], sd.t[1]) # create 'noise' for y data
x.noise <- rnorm(n,mean.t[2], sd.t[2]) # create 'noise' for x data
x.2 <- var + x.noise # make noise x variable
y.2 <- var + y.noise # make noise y variable

# plot the two variables
plot(x.2, y.2, pch = 19, las = 1)

# perform correlation analysis
m.corr <- cor(x.2, y.2)
str(m.corr)


# --- regression ------
# two numeric variables,
# an explanatory and response variable

# assume x to be the explanatory and y the response
m.regr <- lm(y.2 ~ x.2) # perform regression
str(m.regr) # check the structure of the model object
summary(m.regr) # get summary of the model object
abline(m.regr, col = "red") # add a red abline which represent the model fit

# access the regression coefficients, in this case the slope
m.regr$coefficients[2]

# checking assumptions of normality
plot(m.regr)

# ----- end ------

