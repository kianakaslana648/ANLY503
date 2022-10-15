library(rstudioapi)
library(readr)
library(plyr)
library(dplyr)
library(corrplot)
library(ggplot2)
library(reshape2)
library(stringr)
library(caret)
library(rpart)
library(rattle)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

### load 3 csv files
df_ta <- read.csv("part-1-data/TSUMOTO_A.CSV")
df_tb <- read.csv("part-1-data/TSUMOTO_B.CSV")
df_tc <- read_csv("part-1-data/TSUMOTO_C.CSV")
df_tc <- as.data.frame(df_tc)

### have a brief view of the dataframes
head(df_ta)
head(df_tb)
head(df_tc)



##### Create the visualization of correlation plot for continuous variables in df_tc
### remove all the categorical variables as well as ID & Date
df_tc_imp <- df_tc[, -c(1, 2)]
df_tc_con <- df_tc_imp[, sapply(df_tc_imp, class) == "numeric"]

### create the correlation matrix and plot
mat_con <- cor(df_tc_con, use = "pairwise.complete.obs")
png(file = "part-1-figures/figure1.png")
corrplot(mat_con,
  type = "upper", title = "Correlations of Continuous Variables",
  mar = c(0, 0, 1, 0)
)

dev.off()



##### Create the visualization of boxplot of antibody levels in negatives and positives
### remove all the other columns
df_tb_imp <- df_tb[, sapply(df_tb, class) == "numeric"]
df_tb_imp["Thrombosis"] <- df_tb$Thrombosis

### change the thrombosis column as a binary categorical variable as positive and negative
df_tb_imp$Thrombosis <- as.factor(ifelse(df_tb_imp$Thrombosis > 0, "positive", "negative"))

### extract negative and positive rows separately
df_tb_imp_n <- df_tb_imp[df_tb_imp$Thrombosis == "negative", ]
df_tb_imp_p <- df_tb_imp[df_tb_imp$Thrombosis == "positive", ]

### melt the dataframe for plot
df_gather <- melt(df_tb_imp, id = c("Thrombosis"))

### make the plot
png(file = "part-1-figures/figure3.png")
ggplot(df_gather, aes(x = Thrombosis, y = value)) +
  geom_boxplot(aes(fill = Thrombosis)) +
  facet_wrap(~variable) +
  coord_cartesian(ylim = c(-1, 20)) +
  ggtitle("Difference in Antibody Levels between Negatives and Positives") +
  xlab("Result") +
  ylab("Antibody Level")

dev.off()

### do t-test on the three antibody levels
t.test(df_tb_imp_n$aCL.IgG, df_tb_imp_p$aCL.IgG, alternative = "less")
t.test(df_tb_imp_n$aCL.IgG, df_tb_imp_p$aCL.IgM, alternative = "less")
t.test(df_tb_imp_n$aCL.IgG, df_tb_imp_p$aCL.IgA, alternative = "less")



##### Create the visualization of multiple-scatterplot by time of variables in common
##### laboratory examinations for certain patient detected positive
### remove all the other column
df_tt <- df_tc[, sapply(df_tc, class) == "numeric"]

### extract the IDs of positive patients
num_list <- (1:length(df_tb$Thrombosis))[df_tb$Thrombosis != 0]

### explore on certain positive patient
num <- num_list[2]

### filter the past examination records in the third dataframe
df_pl <- filter(df_tt, ID == df_tb[num, "ID"])

### transform the date list to days with the first examination date being the first day
transform <- function(date) {
  new_days <- numeric(length(date))
  min_year <- date[1] %/% 10000
  min_month <- (date[1] - min_year * 10000) %/% 100
  min_day <- date[1] %% 100
  min_year <- min_year + 1900
  for (i in 1:length(date)) {
    year <- date[i] %/% 10000
    month <- (date[i] - year * 10000) %/% 100
    day <- date[i] %% 100
    year <- year + 1900
    new_days[i] <- as.numeric(ISOdate(year, month, day) - ISOdate(min_year, min_month, min_day))
  }
  return(new_days)
}

### compute year, month, day of the first examination
min_year <- df_pl$Date[1] %/% 10000
min_month <- (df_pl$Date[1] - min_year * 10000) %/% 100
min_day <- df_pl$Date[1] %% 100
min_year <- min_year + 1900

### transform the date list
df_pl$Date <- transform(df_pl$Date)

### compute the days of special examination since the first common examination
exam_date <- as.numeric(unlist(str_split(df_tb[num, "Examination.Date"], "/")))
exam_day <- as.numeric(ISOdate(exam_date[1], exam_date[2], exam_date[3]) -
  ISOdate(min_year, min_month, min_day))

### melt the dataframe for plot
df_gather <- melt(df_pl, id = c("ID", "Date"))

### make the plot
png("part-1-figures/figure5.png")
ggplot(df_gather, aes(x = Date, y = value)) +
  geom_point() +
  facet_wrap(~variable, scales = "free") +
  ggtitle("Results from Past Examinations of a Positive Patient") +
  xlab("Days Since first Examination") +
  ylab("Different Attributes")
dev.off()



##### Create the visualization of antibody levels in different genders
### remove all the useless columns
df_tb_gen <- df_tb[, sapply(df_tb, class) == "numeric"]
df_tb_gen["ID"] <- df_tb$ID
df_tb_gen <- join(df_tb_gen, df_ta[, c("ID", "SEX")], by = "ID")
df_tb_gen <- df_tb_gen[!is.na(df_tb_gen$SEX), ]
df_tb_gen <- df_tb_gen[df_tb_gen$SEX != "", ]

### melt the dataframe for plot
df_gather <- melt(df_tb_gen, id = c("ID", "SEX"))

### make the plot
png("part-1-figures/figure2.png")
ggplot(df_gather, aes(x = SEX, y = value)) +
  geom_jitter(aes(colour = SEX)) +
  facet_wrap(~variable, scales = "free") +
  coord_cartesian(ylim = c(0, 20)) +
  ggtitle("Antibody Levels in Different Genders") +
  xlab("Gender") +
  ylab("Antibody Level")
dev.off()



##### Create the visualization of the decision tree
### remove all the useless columns
df_tb_mo <- df_tb[, !names(df_tb) %in% c("ID", "Examination.Date", "Diagnosis", "Symptoms")]
df_tb_mo$ANA.Pattern <- as.factor(df_tb_mo$ANA.Pattern)
df_tb_mo$KCT <- as.factor(df_tb_mo$KCT)
df_tb_mo$RVVT <- as.factor(df_tb_mo$RVVT)
df_tb_mo$LAC <- as.factor(df_tb_mo$LAC)
df_tb_mo$Thrombosis <- as.factor(df_tb_mo$Thrombosis)

### make data partition
intrain <- createDataPartition(y = df_tb_mo$Thrombosis, p = 0.8, list = FALSE)
training <- df_tb_mo[intrain, ]
testing <- df_tb_mo[-intrain, ]

### fit the model
fitR <- rpart(Thrombosis ~ .,
  data = training, method = "class"
)

### make prediction on the testing dataset
predictedR <- predict(fitR, testing,
  type = "class",
  minsplit = 1,
  minbucket = 1,
  maxdepth = 5
)

### make the table
table(predictedR, testing$Thrombosis)

### make the plot for the decision tree
png("part-1-figures/figure4.png")
fancyRpartPlot(fitR, tweak = 1, main = "Decision Tree Structure", caption = "")
dev.off()
