install.packages("downloader")
library(downloader)
url <-
  "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile = filename)
x <- unlist(read.csv(filename))

set.seed(1)

# empty vector to store the results
sample_means <- numeric(1000)

# number of samples to take
num_samples <- 1000

# Sample size
sample_size <- 5

for (i in 1:num_samples) {
  sample_dat <- sample(x, sample_size)
  
  sample_mean <- mean(sample_dat)

  sample_means[i] <- sample_mean
}

# average of the original dataset
dat_avg <- mean(x)

## Calculate the Absolute Differences:
# the absolute difference measures how far each sample average is from the population average
diff_original_sample <- sample_means - dat_avg
# get a vector of absolute differences.
abs_diff <- abs(diff_original_sample)

# check if the absolute difference is greater than 1 gram
# create a logical vector which contains TRUE or FALSE values
comparision <- abs_diff > 1

# Calculate the proportion of sample averages that are more than 1 gram away
# By taking the mean of the logical vector, you calculate the proportion of TRUE values, 
# which represents the proportion of sample averages that are more than 1 gram away from the population average.
proportion <- mean(comparision)

proportion

# The resulting proportion will be a number between 0 and 1. 
# A value of 0 indicates that none of the sample averages are more than 1 gram away from the population average, 
# while a value of 1 would mean that all sample averages meet this criterion.

# If a large proportion of sample averages meet this criterion, it may suggest that the population average and the sample averages are significantly different. 
# In contrast, a small proportion suggests that the sample averages are close to the population average.

# this analysis is used to determine whether the random samples are reflective of the larger population, 
# or if there are significant deviations in the average weight of these samples. 
# It helps researchers or analysts understand the reliability of their sample data in relation to the entire population, 
# which is crucial for making valid inferences and generalizations.
