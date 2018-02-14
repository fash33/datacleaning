# Exercise 2.1 Type conversions
## a
file <- "./warpbreaks.csv"
warpbreaks <- read.csv(file, header = TRUE)
str(warpbreaks)
## b 
# The natural format for the number of breaks need not be numeric
warpbreaks$breaks <- as.numeric(warpbreaks$breaks)
class(warpbreaks$breaks)
## c
mean[1]
typeof(mean)

# Exercise 2.2 
v <- factor(c("2", "3", "5", "7", "11"))

## a coerced v to a character type from factor 
v <- as.character(v)

## b coerced v to a numeric Vector from character 
v <- as.numeric(v)

## c
v <- as.integer(v)

# Exercise 2.3 
##a
file <- "./example.txt"
data <- readLines(file)

##b
has_comments <- grepl("^//", data)
comments <- data[has_comments]
non_comments <- data[!has_comments]

## c
library(lubridate)
date_created <- dmy(comments[1])

## d(a)
non_comments <- strsplit(non_comments, ";")

## d(b)
non_comments <- lapply(non_comments, AppendX)

## d(c)
non_comments <- matrix(unlist(non_comments), nrow = length(non_comments), byrow = TRUE)

## e
comments <- sub("// Field [1-9]: ","", comments)
comments <- comments[-1]
colnames(non_comments) <- comments
non_comments

# Exercise 2.4
## a
info <- data.frame(non_comments, stringsAsFactors = F)

## b
library(stringdist)
codes<- c("male", "female")
matches <- amatch(info$Gender, codes, maxDist = 4)
info$Gender <- factor(codes[matches])
levels(info$Gender) <- list(man = "male", woman = "female")

## c
info$Age..in.years. <- as.integer(info$Age..in.years.)

## d
info$Weight..in.kg. <- gsub(",",".", info$Weight..in.kg.)
info$Weight..in.kg. <- as.numeric(info$Weight..in.kg.)

