library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(arrow)
library(dplyr)
library(stringr)
library(r2d3)

dat <- read_parquet('power.parquet') %>% data.frame()

dat[is.na(dat)] <- 0

dat$Date = as.POSIXct(dat$Date, format='%d/%m/%Y')

dat2 = dat %>%
  select(c('Date','Global_active_power')) %>%
  group_by(Date) %>%
  summarise(total_power = sum(Global_active_power)) %>%
  data.frame()

dat2$Date = as.character(dat2$Date)

tail(dat2, 20)


r2d3(data=dat2, script = "assignment-d3.js")
