# plot the 30d mortality rates for heart attack
# reading the column as character. Was factor before. 
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome) # number of rows
names(outcome) # names of each column
# coerce the column to be numeric
outcome[, 11] <- as.numeric(outcome[, 11]) #column 11 has the 30d DR from HA
hist(outcome[, 11]) #histogram of column 11