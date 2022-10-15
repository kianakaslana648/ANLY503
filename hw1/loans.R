library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(reshape)
library(dplyr)
library(stringr)
loans<-read.csv('data/loans.csv')

colnames(loans)

head(loans)

tidy_loans <- melt(loans,id=c('id','account_id','date','amount',
                              'payments'))

tidy_loans <- filter(tidy_loans,value !='-')
variable<-str_split_fixed(as.character(tidy_loans$variable),'_',2)

month=variable[,1]
month=str_sub(month,-2)
status=variable[,2]

tidy_loans=select(tidy_loans,-c(variable,value))
tidy_loans['month']=month
tidy_loans['status']=status

write.csv(tidy_loans,'loans_r.csv',row.names=FALSE)
