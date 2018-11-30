# =============================================================================
#
#  main file where I put global variables, libraries needed loading and source 
# typically start with the version of R it works on
# 
R.version.string
#  "R version 3.5.1 (2018-07-02)"
#

#
#
# NOTES
# • 
#
#
# good coding does not go beyond 80 characters on a line... (not me!)
# https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml
# Set this in RStudio
#Tools -> Global Options -> Code -> Display
# [ ] Show margin
# Margin column [80]
# =============================================================================

# I like to set the working dir so I can always retrace where files should be 
# in case the code fails
working.dir <- getwd()
# "/Users/thorveen/Dropbox/Text_books/MattR"
# to make sure it goes to the folder you want you can use setwd
# (does not make much sense now)
setwd(working.dir)

# which libraries to use
# libraries contain specific functions and they come in many shapaes an forms
library(nlme)

# if you don't have the library yet, install it! Either through the 'Tools' menu
# or install.packages("name of package")


# === folder management ===
# names of folders for output data (figures,data output,data)
# store names of the folders in an object
output.folder.names <- c("figures", "data output", "data")
# and make the folders if they don't exit yet. No need to understand this now
for(i in 1:length(output.folder.names)) 
  if(file.exists(output.folder.names[i]) == FALSE) 
    dir.create(output.folder.names[i])

# you need to store in an object the file path to these folders so we can 
# read from them and write to them.
# again no need to understand the code
path.figures <- paste(working.dir, "/", output.folder.names[1], "/", sep = "")
path.data.output <- paste(working.dir, "/", output.folder.names[2], "/", 
                          sep = "")
path.data <- paste(working.dir, "/", output.folder.names[3], "/", sep = "")

# === ready to play! ====

# let's store one 

# save the ovevriew file
write.csv(overview, paste(path.data.output,"overview.csv", sep = ""))

# analyses has been done. Let use Markdown to go look at the overview data 
# file and make a report
# the cool thing is that if we change (e.g. add data) this will change in 
# the markdown file as well will do this in a seperate file






