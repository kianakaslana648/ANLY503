library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(reshape)
library(dplyr)
library(tidyr)
library(plyr)
library(stringr)
districts<-read.csv('data/districts.csv')
head(districts)

temp=str_split_fixed(str_sub(districts$municipality_info,2,-2),',',4)

districts['Population<500']=temp[,1]
districts['Population_500-1999']=temp[,2]
districts['Population_2000-9999']=temp[,3]
districts['Population>=10000']=temp[,4]
districts=select(districts,select=-c(municipality_info))

temp=str_split_fixed(str_sub(districts$unemployment_rate,2,-2),',',2)

districts['unemployment_rate_95']=temp[,1]
districts['unemployment_rate_96']=temp[,2]
districts=select(districts,select=-c(unemployment_rate))


temp=str_split_fixed(str_sub(districts$commited_crimes,2,-2),',',2)

districts['crime_rate_95']=temp[,1]
districts['crime_rate_96']=temp[,2]
districts=select(districts,select=-c(commited_crimes))

head(districts)

write.csv(districts,'district_r.csv',row.names=FALSE)
