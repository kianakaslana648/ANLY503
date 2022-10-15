library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(readr)
library(plyr)

### Load 3 csv files
df_ta <- read.csv("part-1-data/TSUMOTO_A.CSV")
df_tb <- read.csv("part-1-data/TSUMOTO_B.CSV")
df_tc <- read_csv("part-1-data/TSUMOTO_C.CSV")
df_tc <- as.data.frame(df_tc)

### join them together
df <- join(df_ta, df_tb, by = "ID", type = "inner")
df <- join(df, df_tc, by = "ID", type = "inner")

### export the final dataframe
write.table(df, "thrombosis.csv", na = "", row.names = FALSE)
