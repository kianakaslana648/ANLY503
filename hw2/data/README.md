# US census data 1900-2010

This folder contains data sets for the US population by age, race and sex from 1900 to 2010 every 10 years. This is raw data from the [US Census Bureau ](https://www.census.gov) and is freely available. 



## Files

1. `pe-11-*.csv` are the data from 1900 to 1970 by age (1-year), race (white, non-white) and sex
2. `National-intercensal-data-*.TXT` give data (to be extracted) from 1980 and 1990 by age (1-year), race (white, black, "American Indian, Eskimo, and Aleut", and "Asian and Pacific Islander") and sex. This data is in fixed-width format and the key is provided in `National-intercensal-data-layout-1980-1990.txt`. 
3. `National-intercensal-data-2000-2010.csv` has data (to be extracted) from April 2000 and April 2010 on age (5-year groups), race (white, black, "American Indian and Alaskan Native", "Asian", and"Native Hawaiian and Other Pacific Islander"). This data also has data on individuals self-identifying as "Two or more races". The data information is in wide format, with the key provided in `National-intrcensal-data-layout-2000-2010.pdf`. 

## Activity

This data corpus needs to be munged to create a data set a single data set comprising

1. Years from 1900 to 2010 every 10 years. When month data is available, you want to include data from April of that year
2. Ages by the 5 year groups that are provided in the 2000/2010 data
3. Sex (male/female)
4. Race (White/non-white). You can decide (be explicit) on how you deal with the multi-racial category. It's important to note that Hispanics are an ethnicity and not a race under the Census categorization, so you should only take the data that is not further subdivided by Hispanic status. 



Once you have this data munged, there are various ways to visualize it, emphasizing different aspects that you might want to highlight. 

Write a paragraph describing what aspect of this data you are highlighting, and create two static visualizations, one using R and ggplot2, one using Python and matplotlib/seaborn/pandas, that showcases your vision. 

Note that we're not expecting perfection right now. We will re-visit this data set later in the term and see how you progress along your data visualization journey.