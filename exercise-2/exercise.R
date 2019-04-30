### Exercise 2: Data Frame Practice with dplyr

## This exercise need the "fueleconomy" package.  Install and load it.
## You should have have access to the `vehicles` data.frame
#install.packages("fueleconomy")
library(fueleconomy)

## Install (if you haven't already) and load the `dplyr`package
library(dplyr)

# You should have have access to the `vehicles` data.frame
#View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles_1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles_1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
vehicles_2wheel_20miles_plus <- filter(vehicles, drive == "2-Wheel Drive", cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
filtered.mpg <- filter(vehicles_2wheel_20miles_plus, hwy == min(hwy))
worst_hw_id <- select(filtered.mpg, id)
# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
make_year_filter <- function(mk, yr){
  filtered <- filter(vehicles, year == yr, make == mk) %>% filter(hwy == max(hwy))
  return (filtered)
}

# What was the most efficient honda model of 1995?
x <- make_year_filter("Honda", 1995)