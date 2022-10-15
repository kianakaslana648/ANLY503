library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(reshape)
library(dplyr)
library(tidyr)
library(plyr)
library(stringr)
library(ggplot2)
library(ggpubr)

df=read.csv('analytical_r.csv')

head(df)

vis_df=df[,c('num_customers','max_balance','min_balance')]
vis_df$num_customers=as.factor(vis_df$num_customers)

png('base-visualization.png')
p1=ggplot(vis_df,aes(x=num_customers,y=max_balance,fill=num_customers))+
            geom_boxplot()+ggtitle('Max Balance among Accounts with Different Numbers of Customers')+
  xlab('Number of Customers')+ylab('Max Balance')
p2=ggplot(vis_df,aes(x=num_customers,y=min_balance,fill=num_customers))+
  geom_boxplot()+ggtitle('Min Balance among Accounts with Different Numbers of Customers')+
  xlab('Number of Customers')+ylab('Min Balance')

ggarrange(p1,p2,ncol=1,nrow=2)

dev.off()
