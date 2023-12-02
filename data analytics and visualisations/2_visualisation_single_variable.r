#this code will create a simulated dataset based on information about the
# supermarket shopping habits of UK families. We create a dataset
# representing 500 simulated observations.
# The variables are
# -spend - amount spent on weekly supermarket shop
# -qtime - time spent queuing at checkout/ collection point
# -famsize - no. of household members in addition to buyer
# -store - indicates whether the store is 1: urban, 2 :rural,
# 3 : citycentre
# -shoptype - 0: instore shop, 1: online collection, 2: online home delivery 
# -income - estimated household income
# The setwd() command is optional - you may edit it to your own file
# storage directory or omit entirely
#setwd()

# setting the seed to generate the same dataset 
# every time the code is run
# Create a simulated dataset
set.seed(2275285)
spend <- rnorm(500, 105, 15.75)
qtime <- rpois(500, 7)
famsize <- rpois(500, 4)
store <- sample(1:3, 500, replace = TRUE)
shoptype <- rbinom(500, 2, 0.14)
income <- rnorm(500, 38000, 4500)
weeklyshop <- data.frame(spend, qtime, famsize, store, shoptype, income)

# Create a histogram using base R
hist(weeklyshop$spend, 
    main = "Histogram of Spend", 
    xlab = "Amount Spent", 
    ylab = "Frequency",
    col = "lightblue",
    border = "white",
    breaks = 20)

summary(weeklyshop$spend)