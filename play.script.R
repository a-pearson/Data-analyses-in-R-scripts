#
# this is my first bit of R code.
#
#
#

# assign a number to an object using the assignment operator (<-)
store.number <- 4
# show what is stored in object store.number
store.number

ha.ha <- "hahhahahahahahah this is funny"
# what structure is the object usinga  function 'str()'
# the () indicate its a function
?str
#

str(store.number)
str(ha.ha)

# step it up, a vector of three elements
t.numbers <- c(3, 5, 8)
t.numbers
str(t.numbers)
 # [] indicate the position within the object
t.numbers[2]

# the 'x:y' indicates a range from x to y , e.g. 2,3 = 2:3
t.numbers[ c(2:3)]
1:10

# let's get position 1 and 3
t.numbers[ c(1,3)]
