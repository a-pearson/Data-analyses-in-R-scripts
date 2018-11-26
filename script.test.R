#
# project description
# The aim of this code is to show some of the R basics.
# • what are objects and what can you store in them?
# • how do functions work?
# • how do I make a plot and save a plot it?
# • how do I read a file and how do I save a file?

#-------------------------------------------------------------------------------
# one of your biggest friend in R is R help
# pretty cryptic but tons of info
?mean

#-------------------------------------------------------------------------------
# • what are objects?
# R stored whatever you want in an object.
# the simples is a numeric vector of length 1
just.a.number <- c(1)
# running the name gives you the content
just.a.number

# what sructure is it?
str(just.a.number)
# or
class(just.a.number)
# how many elements does the object have?
length(just.a.number)

# or a character
just.a.char <- c("nice one")
just.a.char

# > 1 elements
t.vector <- c(1,66,7,88,4,7)
str(t.vector)
length(t.vector)

# matrix is .. a matrix. Needs to have multiple columns and rows
(t.matrix <- matrix(c(4,4,3,3), 2, 2))
# aaah first fills the columns
# let's give the columns names
colnames(t.matrix) <- c("fours", "threes")
t.matrix    # much better

# the workhorse of objects in R is the dataframe.
# columns can have different data types. Wicked
# let't make one

t.char <- c("blue", "red", "blue", "blue", "purple", "red")

t.data.frame <- cbind.data.frame(t.char, t.vector)
str(t.data.frame)


#-------------------------------------------------------------------------------
# how do functions work?
# a preset routine.
?mean
mean(c(3,5,7,9))

# there are tons of useful functions like this
# make a sequence
seq(1,9,0.1)
# take the range of the sequence
range(seq(1,9,0.1))
#take the cosine
cos(seq(1,9,0.1))
# but I only want absolute numbers
abs(cos(seq(1,9,0.1)))
# and the fun just started.....

# you can make a function real easy
plusseR <- function(x1, x2){
  plus <- x1 + x2
  return(plus)
}

plusseR

# let's test it: 10 + 3 is....
plusseR(10,3)

#-------------------------------------------------------------------------------
# • how do I make a plot and save a plot it?
x.val <- c(1:10)
y.val <- runif(length(x.val), 2, 10)
?plot 
plot(x.val, y.val)
# too basic
plot() # cursus between the () and press 'tab'
plot(x.val, y.val, xlab = "day of the month", ylab = "random weight", 
     col = "red", pch = 19, las = 1)
# acceptable(-ish)
# save as pfd
pdf("test.pdf", width = 5, height = 5)
plot(x.val, y.val, xlab = "day of the month", ylab = "random weight", 
     col = "red", pch = 19, las = 1)
dev.off()
# where is it stored?

# we want it in the figures folder!!
path.test <- paste(path.figures, "test.in.folder.pdf", sep ="")
pdf(path.test, width = 5, height = 5)
plot(x.val, y.val, xlab = "day of the month", ylab = "random weight", 
     col = "red", pch = 19, las = 1)
dev.off()
#-------------------------------------------------------------------------------
# • how do I save a file and how do I read a file and ?

write.csv(t.data.frame, "files.csv",row.names = FALSE)
# now to tha data.output folder
write.csv(t.data.frame, paste(path.data.output,"files.csv", sep =""), 
          row.names = FALSE)


# let's read a file from the data folder
# what files are there?
t.name.file <- list.files(path.data)
t.file.from.data <- read.csv(t.name.file, stringsAsFactors = FALSE)
t.file.from.data
str(t.file.from.data)  
