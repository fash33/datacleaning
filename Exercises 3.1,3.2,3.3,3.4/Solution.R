# Exercise 3.1
## a
data <- read.csv("./dirty_iris.csv", header = TRUE, stringsAsFactors = FALSE)

## b
num_of_complete_cases <- length(which(complete.cases(data)))
percent_of_complete_cases <- num_of_complete_cases/ length(complete.cases(p)) * 100

##c
is.na(data) <- sapply(data, is.infinite)
data[is.na[data]] <- NA

#Exercise 3.2
library(editrules)
## a
rules <- editfile("./rules.txt")
rules

##b
violations <- violatedEdits(rules, data)
errors <- length(which(violations))
summary(violations)
plot(violations)

## c 
no_error <- length(violations) - errors
no_error_percentage <- no_error/length(violations) * 100

## d
locate_errors <- localizeErrors(rules, data, method = "mip")
petal_errors <- which(locate_errors$adapt[ , "Petal.Length"])
petal_errors

## e
boxplot(data$Sepal.Length)
outliers<-boxplot.stats(data$Sepal.Length)$out
outlier_observations<- data$Sepal.Length %in% outliers
data[outlier_observations, "Sepal.Length"] <- NA
data[outlier_observations,]

# Exercise 3.3
## a
library(deducorrect)
R <- correctionRules("./corrections.txt")
cors <- correctWithRules(R, data)
cors
## b
data[locate_errors$adapt]<- NA

# Exercise 3.4
## a
library(VIM)
data2 <- kNN(data)

## b
last <- mean(data$Petal.Width, na.rm = TRUE)
data$Petal.Width <- seqImpute(data[order(data$Species),]$Petal.Width, last)

## c
data$Petal.Width <- seqImpute(data[order(data$Species, data$Sepal.Length),]$Petal.Width, last)
