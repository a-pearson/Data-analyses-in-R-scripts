
#
# day 02 problem sets
#
#  2d,e, 4g,f

# 2
# d
lifetime.repr.succ <- c(0:8)
females <- c(30, 25, 3, 6, 8, 4, 0, 4, 1)
males <- c(38, 17, 7, 6, 4, 10, 2, 0, 0)
d.succ <- data.frame(lifetime.repr.succ, females, males)
str(d.succ)
# using rep() we should make a vector with 30 * 0, 25 * 1, etc for females
fem <- rep(lifetime.repr.succ, females)
m.females <- mean(fem) # 1.691358
# let's round this to two decimals
(round(m.females, 2))

# males
man <- rep(lifetime.repr.succ, males)
m.males <- mean(man) # 1.511905
# let's round this to two decimals
(round(m.males, 2))

# e
#female
var(fem[fem > 4])
var(fem[fem >= 4])

#male
var(man[man > 4])
var(man[man >= 4])

# huge difference in variance if you include 4 or not



# 4
# g
flowers <- c(51, 45, 61, 76, 11, 117, 7, 132, 52, 149) 
(mean.f <- mean(flowers))		# the mean of the flowers
(sd.f <- sd(flowers))			# the standard deviation
(se.f <- sd.f/sqrt(length(flowers)))	# the standard error of the estimate
# approximation of th 95% confidence interval (CI)
CI.f <- c((mean.f - 2 * se.f), (mean.f + 2 * se.f))

# h let's simulate data and see how close the mean and sd are to 
# what we calculated
sample.25 <- rnorm(25, mean = mean.f, sd = sd.f)
mean(sample.25)
sd(sample.25)

# repeat, but for n = 100
sample.100 <- rnorm(100, mean = mean.f, sd = sd.f)
mean(sample.100)
sd(sample.100)

# rerun these a couple of times and see how much flucatcion
# these values give.
# the smaller the sample size the more variation in mean of the sample
# if you collect the means many times and plot them, you have the
# the sample distribution. the sd of this = the standard error 
# associated with the mean of your sample

# here is the code to get a sampling distribution of 1000 samples taken
store.means <- rep(NA,1000)
sample.size <- 10
for(i in 1:1000){
  store.means[i] <- mean(rnorm(sample.size, mean = mean.f, sd = sd.f))
}
hist(store.means, col = "blue", las = 1, xlab = "sample mean", 
     main = "sampling distribution")
box()
# change sample.size to see how the witdth of the sampling distribution
# varies

