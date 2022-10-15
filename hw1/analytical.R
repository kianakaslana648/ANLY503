library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(reshape)
library(dplyr)
library(tidyr)
library(plyr)
library(stringr)

##load data
accounts<-read.csv('data/accounts.csv')
cards<-read.csv('data/cards.csv')
clients<-read.csv('data/clients.csv')
districts<-read.csv('data/districts.csv')
links<-read.csv('data/links.csv')
loans<-read.csv('loans_r.csv')
payment_orders<-read.csv('data/payment_orders.csv')
transactions<-read.csv('data/transactions.csv')

##brief view
head(accounts)
head(districts)
head(cards)
head(clients)
head(links)
head(loans)
head(payment_orders)
head(transactions)


tidy_acc=accounts
colnames(tidy_acc)=c('account_id','district_id','open_date','statement_frequency')

tidy_dis=select(districts,c(id,name))
colnames(tidy_dis)=c('district_id','district_name')

temp=table(links$account_id)

tidy_lin=data.frame(temp)
colnames(tidy_lin)=c('account_id','num_customers')

temp_links=links[,c('client_id','account_id')]
temp_cards=cards[,c('id','link_id')]
colnames(temp_cards)=c('id','client_id')
temp=join(temp_links,temp_cards, by='client_id')


temp=filter(temp,id!='NA')
temp_tab=table(temp$account_id)
temp_cards=as.data.frame(temp_tab)
colnames(temp_cards)=c('account_id','credit_cards')
temp_cards$account_id=as.integer(as.character(temp_cards$account_id))

tidy_loans=select(loans,-c(id,date))
colnames(tidy_loans)=c('account_id','loan_amount','loan_payments',
                       'loan_term','loan_status')
tidy_loans['loan_default']=tidy_loans$loan_status=='B'
has_loan=final_df$account_id %in% tidy_loans$account_id

tidy_wit=select(filter(transactions,type=='credit'),c(account_id,amount))
wit_max=aggregate(amount~account_id,data=tidy_wit,max)
wit_min=aggregate(amount~account_id,data=tidy_wit,min)
wit_cc=table(tidy_wit$account_id)
wit_cc=as.data.frame(wit_cc)
colnames(wit_max)=c('account_id','max_withdrawal')
colnames(wit_min)=c('account_id','min_withdrawal')
colnames(wit_cc)=c('account_id','cc_payments')

tidy_bal=select(transactions,c(account_id,balance))
bal_max=aggregate(balance~account_id,data=tidy_bal,max)
bal_min=aggregate(balance~account_id,data=tidy_bal,min)
colnames(bal_max)=c('account_id','max_balance')
colnames(bal_min)=c('account_id','min_balance')

final_df=join(tidy_acc,tidy_dis,by='district_id')
final_df=select(final_df,-c(district_id))
final_df=join(final_df,tidy_lin,by='account_id')
final_df$num_customers[is.na(final_df$num_customers)]=0
final_df=join(final_df,temp_cards,by='account_id')
final_df$credit_cards[is.na(final_df$credit_cards)]=0
final_df['loan']=has_loan
final_df=join(final_df,tidy_loans,by='account_id')
final_df=join(final_df,wit_max,by='account_id')
final_df=join(final_df,wit_min,by='account_id')
final_df=join(final_df,wit_cc,by='account_id')
final_df=join(final_df,bal_max,by='account_id')
final_df=join(final_df,bal_min,by='account_id')

colnames(final_df)

write.csv(final_df,'analytical_r.csv',row.names=FALSE)
