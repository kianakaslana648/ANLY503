library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(readr)
library(plyr)
library(dplyr)
library(ggplot2)

### load the raw data
df_air <- read_csv('part-2-data-GHG.csv')
df_air <- as.data.frame(df_air)

### create the dataframe for white-hat plot
selected_variables=c('1 - Energy','2- Industrial processes and product use',
                       '3 - Agriculture','5 - Waste','6 - Other')

df_us = filter(df_air, Country == 'United States' & Unit=='Tonnes of CO2 equivalent'
               &Variable%in%selected_variables)

df_us=df_us[,c('VAR','Year','Value')]

df_white_hat = df_us

### create the dataframe for black-hat plot
selected_countries=c('Norway','Finland','Sweden')

df_compare= filter(df_air, Country%in%selected_countries & Unit=='Tonnes of CO2 equivalent'
                   &Variable=='Total  emissions excluding LULUCF'&Pollutant=='Carbon dioxide')

df_compare=df_compare[,c('Country','Year','Value')]

df_black_hat <- df_compare %>%
  group_by(Year) %>%
  mutate(perc=`Value`/sum(`Value`)) %>%
  ungroup() %>%
  as.data.frame() %>%
  filter(Year%in%c(1990,2019))


### output csv files
write.table(df_white_hat, "white-hat-data.csv", na = "", row.names = FALSE,sep=',')
write.table(df_black_hat, "black-hat-data.csv", na = "", row.names = FALSE,sep=',')





        
        