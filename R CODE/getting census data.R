#install.packages("tidycensus")
#install.packages("tidyverse")
library(tidyverse)
library(tidycensus)

api_key<-"f4ea45dde45d543afab05aa7ce86b36d5992a42f"
census_api_key("f4ea45dde45d543afab05aa7ce86b36d5992a42f")

##############################
###TESTING STUFF (IGNORE, just messing around. keeping here in case I need to refer to it)
#state_income <- get_acs(geography = "state", variables = "B19013_001")
#head(state_income)
#or_wide <- get_acs(geography = "county", 
#                   state = "OR",
#                  variables = c(hhincome = "B19013_001", 
#                               medage = "B01002_001"), 
#                output = "wide")
#head(or_wide)
# Create a scatterplot
#plot(or_wide$hhincomeE, or_wide$medageE)
#v16<-load_variables(year = 2016,
 #                   dataset = "acs5",
  #                  cache = TRUE)
#v16
# Filter for table B19001
#filter(v16, str_detect(name, "B19001"))
# Use public transportation to search for related variables
#filter(v16, str_detect(label, fixed("public transportation", 
#                                     ignore_case = TRUE)))
#filter(v16, str_detect(label,fixed("race",ignore_case=TRUE)))
#v15 <- load_variables(2016, "acs5", cache = TRUE)
#View(v15)
#B19001_001 is the estimate for household income in 2016
##############################


#Estimate for total number of households
test<-get_acs(geography = "state", variables = "DP03_0051E")

head(test)

#Website with 2017 acs5 info https://api.census.gov/data/2017/acs/acs5/profile/variables.html

# DP03_0088E is Per Capita Income, 0086PE is median family income, 0092E is median earnings for workers
# DP03_0021E is number of workers using public transportation to commute to work exluding taxicab
          # Check to see if number changes over time?

test2<-get_acs(geography = "tract",
               state = "VA",
               variables = "DP03_0088E",
               output = "wide")

head(test2)
view(test2)


#Census apparently doesn't track income, use it for race? https://api.census.gov/data/2010/dec/sf1/variables.html
#This is for blacks only, see webiste to get other races
test3<-get_decennial(geography = "block",
              state = "VA",
              county = "Richmond City",
              variables = "H006003", 
              output = "wide")
head(test3)
view(test3)
