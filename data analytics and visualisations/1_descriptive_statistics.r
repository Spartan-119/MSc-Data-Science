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

# Summary statistics for all variables
summary_all <- summary(weeklyshop)

# Frequency tables for categorical variables
table_store <- table(weeklyshop$store)
table_shoptype <- table(weeklyshop$shoptype)

# Display summary statistics and frequency tables
cat("Summary Statistics for All Variables:\n")
print(summary_all)

cat("\nFrequency Table for 'store' variable:\n")
print(table_store)

cat("\nFrequency Table for 'shoptype' variable:\n")
print(table_shoptype)

# Visualize the distribution of quantitative variables
par(mfrow = c(2, 3))  # Set up a 2x3 layout for six plots

# Histogram for 'spend'
hist(weeklyshop$spend, main = "Histogram of Spend", xlab = "Spend", col = "skyblue")

# Histogram for 'qtime'
hist(weeklyshop$qtime, main = "Histogram of Queue Time", xlab = "Queue Time", col = "lightgreen")

# Histogram for 'famsize'
hist(weeklyshop$famsize, main = "Histogram of Family Size", xlab = "Family Size", col = "lightcoral")

# Histogram for 'income'
hist(weeklyshop$income, main = "Histogram of Income", xlab = "Income", col = "orange")

# Bar plot for 'store' variable
barplot(table_store, main = "Bar Plot of Store", xlab = "Store", col = "lightblue")

# Bar plot for 'shoptype' variable
barplot(table_shoptype, main = "Bar Plot of Shop Type", xlab = "Shop Type", col = "lightgreen")

# Reset the layout to the default (1x1)
par(mfrow = c(1, 1))

