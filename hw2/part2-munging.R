library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(reshape)
library(dplyr)
library(stringr)

years=seq(1900,1970,10)
skips=c(5,5,5,5,5,5,4,4)
tails=c(77,77,77,77,87,87,87,87)
colen=c(10,10,10,10,10,10,13,13)
pe11=data.frame()

for(j in 1:8){
  year=years[j]
  file=paste('data/pe-11-',as.character(year),'.csv',sep='')
  df1<-read.csv(file,skip=skips[j])
  df1<-df1[-c(1,3),]
  df1<-df1[1:tails[j],]
  for(i in 2:colen[j]){
    df1[,i]<-as.numeric(gsub(',','',df1[,i]))
  }
  if(j>=7){
    df1['Nonwhite_Total']=df1[8]+df1[11]
    df1['Nonwhite_Male']=df1[9]+df1[12]
    df1['Nonwhite_Female']=df1[10]+df1[13]
    df1=subset(df1,select=-c(8,9,10,11,12,13))
  }
  
  colnames(df1)<-c('age','All_Total','All_Male','All_Female',
                   'White_Total','White_Male','White_Female',
                   'Nonwhite_Total','Nonwhite_Male','Nonwhite_Female')
  rownames(df1)<-1:tails[j]
  
  df1m<-melt(df1,id=c('age'))
  variable<-str_split_fixed(df1m$variable,'_',2)
  races=variable[,1]
  gender=variable[,2]
  df1m['races']=races
  df1m['gender']=gender
  df1m<-select(df1m,select=-c(variable))
  df1m['year']=rep(year,tails[j])
  if(year == 1900){
    pe11=df1m
  }else{
    pe11=rbind(pe11,df1m) 
  }
}
pe11<-filter(pe11,gender!='Total')

ageGroup<-function(x){
  return(ifelse(x=='All ages',0,
                ifelse(as.character(substr(x,1,2))>=75,
                       16,floor(as.numeric(x)/5)
                       +1)))
}

pe11$ageGroup=ageGroup(pe11$age)
pe11<-filter(pe11,races!='All')
pe11<-select(pe11,-c(age))
pe11<-pe11[,c(4,5,2,3,1)]
colnames(pe11)<-c('year','ageGroup','race','gender','population')
pe11<-aggregate(population~year+ageGroup+race+gender,
          pe11,sum)



years=c(1980,1990)
ni_tt=data.frame()
for(year_c in years){
  ni_c<-read.csv(paste('data/National-intercensal-data-',as.character(year_c)
                       ,'.TXT',sep=''),header=FALSE)
  n=dim(ni_c)[1]
  ni=data.frame(series=numeric(0),month=numeric(0),
                year=numeric(0),age=numeric(0),
                white_male=numeric(0),
                white_female=numeric(0),
                nonwhite_male=numeric(0),
                nonwhite_female=numeric(0))
  for(i in 1:n){
    temp=ni_c[i,1]
    series=substr(temp,1,2)
    month=as.numeric(substr(temp,3,4))
    year=as.numeric(substr(temp,5,6))
    age=as.numeric(substr(temp,7,9))
    rest=as.numeric(scan(text=substring(temp,10),what=' '))
    white_male=rest[4]
    white_female=rest[5]
    nonwhite_male=rest[2]-rest[4]
    nonwhite_female=rest[3]-rest[5]
    onerow=data.frame(series=series,month=month,
                      year=year,age=age,
                      white_male=white_male,
                      white_female=white_female,
                      nonwhite_male=nonwhite_male,
                      nonwhite_female=nonwhite_female)
    ni=rbind(ni,onerow)
  }
  ni<-filter(ni,series=='2I'&month==4&year==(year_c%%100))
  ni=subset(ni,select=-(series))
  ni_t=melt(ni,id=c('month','year','age'))
  variable<-str_split_fixed(ni_t$variable,'_',2)
  races=variable[,1]
  gender=variable[,2]
  ni_t['races']=races
  ni_t['gender']=gender
  ni_t=select(ni_t,-c(variable))
  
  
  ageGroup_1<-function(x){
    return(ifelse(x==999,0,
                  ifelse(x>=75,16,
                         floor(as.numeric(x)/5)+1)))
  }
  ni_t$ageGroup=ageGroup_1(ni_t$age)
  ni_t<-subset(ni_t,select=-c(age,month))
  ni_t<-ni_t[,c(1,5,3,4,2)]
  colnames(ni_t)<-c('year','ageGroup','race','gender','population')
  ni_t<-aggregate(population~year+ageGroup+race+gender,
                  ni_t,sum)
  ni_t$year=rep(year_c,dim(ni_t)[1])
  
  if(year==1980){
    ni_tt=ni_t
  }else{
    ni_tt=rbind(ni_tt,ni_t)
  }
}




ni_2<-read.csv('data/National-intercensal-data-2000-2010.csv')
ni_2<-ni_2[,1:8]
ni_2['Nonwhite_male']=ni_2$TOT_MALE-ni_2$WA_MALE
ni_2['Nonwhite_female']=ni_2$TOT_FEMALE-ni_2$WA_FEMALE

ni_2<-filter(ni_2,month==4)
ni_2<-ni_2[,-c(1,4,5,6)]
colnames(ni_2)<-c('year','ageGroup','White_male',
                  'White_female','Nonwhite_male',
                  'Nonwhite_female')
ni_2t<-melt(ni_2,id=c('year','ageGroup'))
variable<-str_split_fixed(ni_2t$variable,'_',2)
races=variable[,1]
gender=variable[,2]
ni_2t['race']=races
ni_2t['gender']=gender
ni_2t<-subset(ni_2t,select=-c(variable))
ni_2t<-ni_2t[,c(1,2,4,5,3)]
colnames(ni_2t)<-c('year','ageGroup','race','gender','population')

temp_16=aggregate(population~year+race+gender,
          filter(ni_2t,ageGroup>=16),
          sum)
temp_16['ageGroup']=rep(16,dim(temp_16)[1])
ni_2t<-filter(ni_2t,ageGroup<16)
ni_2t<-rbind(ni_2t,temp_16)


final_df=rbind(pe11,ni_tt)
final_df=rbind(final_df,ni_2t)
final_df<-final_df[order(final_df$year,final_df$ageGroup,
                         final_df$race,final_df$gender),]

write.csv(final_df,'part2-analytical-dataset.csv',
          row.names=FALSE)
