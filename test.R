#
# this is to show how R works.
#
#
#

# let's do a simple calculation
1+1

# assign the calculation to an object
drawy <- 1 + 1
?drawy# the ? gives you access to help files
drawy

t.calc <- 1 + 1

# structure of the object through function str()
?str
str(t.calc)

# make simple vector
# c stands for concatenate
(t.vector <- c(3, 5, 6, 7)) 

# structure of the vector
str(t.vector)
# [] gives you access to the different elements in your object
t.vector[3]

# objects come in different classes
class(t.vector)

t.char <- c("a", "twee", "tttw")
class(t.char)

# messed up vector
t.mess <- c(0, 3, 5,"missing", 8)
str(t.mess)

length(t.mess)

# make a matrix
t.matrix <- matrix( c(1.1, 1.2, 1.3, 1.4), nrow = 2, ncol = 2)
class(t.matrix)
str(t.matrix)
?matrix

# let's try to access a specific element of the matrix
t.matrix[2,]
# first row, second column
t.matrix[ 1, 2]

# store multiple data types in one object
# introduce the dataframe

t.names <- c("blue", "red")

tt <- cbind(t.names, t.matrix)
# problem, all characters

# special function, cbind.data.frame
tt2 <- cbind.data.frame(t.names, t.matrix)
str(tt2)
# let's change the first variable from a factor to
# character
tt2$t.names <- as.character(tt2$t.names)
str(tt2)
# others are as.integer, as.numeric, etc

# change names of rows and columns
colnames(tt2) <- c("colour", "pop1", "pop2")

final.file <- tt2
final.file[,c(2,3)] - tt2[,c(2,3)]
# store this as a csv file
write.csv(x = )
write.csv(final.file, "pre.break.highlight.2.csv", row.names = FALSE)

# let's make a simple plot
x.t <- c(1:10) #seq(1, 10, 1)
y.t <- runif(10, 3, 5)
# super basic
plot(x.t, y.t)
# you can pimp it a lot....
plot(x.t, y.t, xlab = "x values", 
     ylab = "random number", las = 1, 
     pch = 19, col = "red")
# write as pdf
pdf("my.first.graph.in.R.pdf", 
    width = 5, height = 5)
plot(x.t, y.t, xlab = "x values", 
     ylab = "random number", las = 1, 
     pch = 19, col = "red")
dev.off() #this stops making the pdf



