library(dplyr)
library(readr)

#0: Load the data in RStudio
titanic <- read_csv("titanic_original.csv")

#possible stuff for RMarkdown
#colnames(titanic)
#distinct(titanic, embarked)

#1: Port of embarkation. Fill in missing values of embarked column with S
titanic <- mutate(titanic, embarked = ifelse(is.na(embarked), "S", embarked))

#2: Age. Replace missing values for age with the mean
titanic <- mutate(titanic, age = ifelse(is.na(age), mean(titanic$age, na.rm = TRUE), age))

#I'm not a fan of filling in the age with the mean. 
#I think those observations should just be left out of any calculations
#If we had to fill in a value, I would prefer the median because it looks like the age data is skewed

#3: Lifeboat. Fill in empty values in the boat column with "none"
titanic <- mutate(titanic, boat = ifelse(is.na(boat), "none", boat))

#4: Cabin
#I think it does make sense to fill in cabin with "none" because those could be passengers without an assigned cabin
titanic <- mutate(titanic, has_cabin_number = ifelse(is.na(titanic$cabin), 0, 1))
