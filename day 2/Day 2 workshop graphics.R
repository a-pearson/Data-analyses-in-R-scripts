#
#
# Workshop  Graphics 
#


getwd()
list.files()

# ============================================================================
# ---- data set 1: mammals -------
# Mammals
mammals<-read.csv("mammals.csv", na.strings="",stringsAsFactors=FALSE)

#--- Frequency tables ----
# 1
# Tabulate mammal frequencies on continents
table(mammals$continent)
#Af      AF     AUS      EA Insular      NA Oceanic      SA 
#1    1033     346    1033    1484     779      78     977 

# 2 Fix "Af"
which(mammals$continent=="Af")
#[1] 322
mammals$continent[322] <- "AF"
table(mammals$continent)
#AF     AUS      EA Insular      NA Oceanic      SA 
#1034     346    1033    1484     779      78     977 

# 3 Tabulate status
table(mammals$status)
#extant      extinct   historical introduction 
#5388          242           84           17
# 242


# 4 Status vs continent
table(mammals$continent,mammals$status)
# extant extinct historical introduction
# AF        1017      13          4            0
# AUS        261      45         23           17
# EA        1027       0          6            0
# Insular   1405      29         50            0
# NA         700      78          1            0
# Oceanic     78       0          0            0
# SA         900      77          0            0


# --- Visualize frequency distributions -----
# 1 
barplot(table(mammals$continent),col="blue", ylab = "Frequency", 
        cex.names=0.8, ylim = c(0,1600))

# 2 sorted by continent
barplot(sort(table(mammals$continent),decreasing=TRUE), col="blue",cex.names=0.8, ylim=c(0,1600), ylab="Frequency")

# 3 histogra of body masses
hist(mammals$mass.grams)
# not very useful

# 4 you can simple add this to the data frame by making $ new variable name
mammals$logmass <- log(mammals$mass.grams, base = 10)
head(mammals)

# 5 histogram log mass
hist(mammals$logmass)

# 6
#hist(mammals$mass.grams^(1/3),col="blue")
hist(mammals$logmass, col="blue", breaks=seq(0, 10, by=2), freq=FALSE)

# 7 differences bind widths.
hist(mammals$logmass, col="blue", breaks=seq(0, 10, by=1), freq=FALSE)
hist(mammals$logmass, col="blue", breaks=seq(0, 10, by=0.5), freq=FALSE)
hist(mammals$logmass, col="blue", breaks=seq(0, 10, by=0.1), freq=FALSE)
# 0.5 seems to be a nice bin width. Quite the difference in how much details 
# you can see depending on the bin width.

# 8 probability density instead of frequency
hist(mammals$logmass, col="blue", breaks=seq(0, 10, by=1), freq=FALSE, 
     prob = TRUE)

# 9 
# Looks 'cut off' on the left and maybe skewed to the right
# QQ plots
qqnorm(mammals$logmass)
qqline(mammals$logmass)
# both are useful, histogram is easier to understand ,QQ plot shows
# deviations but harder to interpret how it looks in the histogram from this.

# 10 add normal density curve
m <- mean(mammals$logmass, na.rm = TRUE)
s <- sd(mammals$logmass, na.rm = TRUE)
norm.curve <- seq(from = min(mammals$logmass, na.rm=TRUE), to = max(mammals$logmass, na.rm = TRUE), length.out = 101)
# draw histogram
hist(mammals$logmass, col="blue", breaks=seq(0, 10, by=0.5), freq=FALSE)
lines(norm.curve, dnorm(norm.curve, mean = m, sd = s) , col = "red", lwd = 2)


# --- Visualizing associations between variables ----
# Box plots of size and extinction status
# 1
boxplot( split(mammals$logmass,mammals$status), boxwex=0.5, ylab = "log mass",
         las = 1)
# trying to undertand how split works
?split()
t <- split(mammals$logmass,mammals$status)
str(t)

# 2
# extinct species were much heavier

# 3
boxplot(logmass~status,data=mammals, ylab="log10 body mass", varwidth=TRUE, 
        main="size and status")

# 4 make a violin plot
install.packages("vioplot")
library(vioplot)
# for whatever reason I can't install violin plot.

# 5 multiple histograms
par(mfrow=c(length(unique(mammals$status)),1), mar = c(4, 4, 2, 1), cex = 0.7) 
for( i in unique(mammals$status) ){
  dat <- subset(mammals$logmass, mammals$status == i)
  hist(dat, col="blue", breaks=seq(0, 10, by=0.5), main = i,freq=FALSE, las = 1)
}

# 6
# Table of sizes vs status
tapply(mammals$logmass,mammals$status,median,na.rm=TRUE)
#      extant      extinct   historical introduction 
#   1.949390     5.176091     3.326606     4.799341


# for fun look at the mean as well
tapply(mammals$logmass,mammals$status,mean,na.rm=TRUE)
#      extant      extinct   historical introduction 
#    2.315660     5.059735     3.442413     4.390715 

#6
# extant species are skewed towards higher values, extinct towards smaller  
  
# ==============================================================================
# ---- data set 2: fruit flies -------------------------------------------------

# 1
x <- read.csv("fruitflies.csv", stringsAsFactors=FALSE)
head(x)
#   Npartners          treatment longevity.days thorax.mm
# 1         8 8 pregnant females             35      0.64
# 2         8 8 pregnant females             37      0.68
# 3         8 8 pregnant females             49      0.68
# 4         8 8 pregnant females             46      0.72
# 5         8 8 pregnant females             63      0.72
# 6         8 8 pregnant females             39      0.76

# or manually
x[1:6, ]

# 2 Graphs of longevities of different treatment groups of males
dev.off() # this reset the number of subpanels to the default 

stripchart(longevity.days~treatment,data=x, vertical=TRUE, method="jitter", 
           pch = 1, las = 1, cex.axis=0.7)
# I personally quite like the stripchart as you see the real data.
# but harder to e.g. see the median.
# pattern is that virgins ahve lower longevity

# 3 box plot
boxplot(longevity.days~treatment,data=x,cex.axis=.7, ylab="Longevity (days)",boxwex=0.5)
# virgin females appear to have lower longevity. yes same pattern visible


# 4
# simple plot. pch = 19 makes the circles solid
plot(longevity.days ~ thorax.mm, data=x, pch = 19)
?lowess

# 5 Advanced stuff!
x$treatment <- as.factor(x$treatment)
levelsT <- levels(x$treatment)
# [1] "1 pregnant female"  "1 virgin female"    "8 pregnant females" "8 virgin females"   "no females added"  

x$colour <- x$treatment
levels(x$colour) <- colour_legend <- c("red","blue","green","black","yellow")

plot(longevity.days~thorax.mm,data=x,col= x$colour, pch = 19)
legend( locator(1), as.character(levels(factor(x$treatment))),
           col= colour_legend, pch = 19)


# 5 and 6 using a loop
# interested in longetvit and treatment.
# how many treatment are there?
treatment.n <- unique(x$treatment)
length(treatment.n) # 5

# let's determine the x and y ranges
xlim.t <- range(x$thorax.mm)
ylim.t <- range(x$longevity.days)
#let's make an empty plot
plot(NA, xlim = xlim.t, ylim = ylim.t, las = 1, xlab = "thorax", 
     ylab = "longevity")
# let's loop through the different treatments, plot the points and the 
# linear regression line
# determin the colours for the diffeerent treatments:
colrs <- c("red", "blue", "yellow", "green", "black")
for(i in 1:length(treatment.n)){
  # select the treatment
  d.temp <- x[x$treatment == treatment.n[i],]
  # plot the points
  points(d.temp$thorax.mm, d.temp$longevity.days, col = colrs[i], pch = 19)
  # do a linear regression and store the model output
  m.t <- lm( d.temp$longevity.days ~ d.temp$thorax.mm)
  # plot the model output using abline and match colour with the points
  abline(m.t, col = colrs[i])
}


