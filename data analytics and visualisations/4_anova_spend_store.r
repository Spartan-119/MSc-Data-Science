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
# Set seed for reproducibility
set.seed(2275285)

# Create simulated dataset
spend <- rnorm(500, 105, 15.75)
qtime <- rpois(500, 7)
famsize <- rpois(500, 4)
store <- sample(1:3, 500, replace = TRUE)
shoptype <- rbinom(500, 2, 0.14)
income <- rnorm(500, 38000, 4500)
weeklyshop <- data.frame(spend, qtime, famsize, store, shoptype, income)

# Compute correlation matrix
cor_matrix <- cor(weeklyshop)

# Print correlation coefficient for each pair
for (i in 1:(ncol(weeklyshop) - 1)) {
    for (j in (i + 1):ncol(weeklyshop)) {
        correlation <- cor(weeklyshop[, i], weeklyshop[, j])
        cat(paste("The correlation coefficient between", names(weeklyshop)[i], "and", names(weeklyshop)[j], "is", round(correlation, 2), "\n"))
    }
}

# Plot heatmap with annotations
heatmap(cor_matrix, 
        main = "Correlation Heatmap",
        xlab = "Variables", ylab = "Variables",
        col = colorRampPalette(c("blue", "white", "red"))(20),
        symm = TRUE, margins = c(8, 8))

# Add text annotations to heatmap cells
for (i in 1:ncol(cor_matrix)) {
    for (j in 1:ncol(cor_matrix)) {
        text(i, j, sprintf("%.2f", cor_matrix[i, j]), cex = 0.8, col = "black", pos = 4)
    }
}

# Calculate correlation between spend and famsize
correlation <- cor(weeklyshop$spend, weeklyshop$famsize)
print(correlation)

# Plot box plot correlation between spend and famsize
boxplot(spend ~ famsize, 
        main = "Association between Spend and Family Size", 
        xlab = "Spend", ylab = "Family Size",
        horizontal = TRUE, col = "pink",
        cex.lab = 1.5, font.lab = 2)

# Fit linear regression model
model <- lm(spend ~ famsize, data = weeklyshop)

# Print summary of the regression model
print(summary(model))
