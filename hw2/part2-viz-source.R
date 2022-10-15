library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(ggplot2)

final_df<-read.csv("part2-analytical-dataset.csv")

viz_df=aggregate(population~ageGroup+year
                 ,final_df,sum)
viz_df=filter(viz_df,ageGroup!=0)

viz_df$ageGroup=as.factor(viz_df$ageGroup)

png('viz_time_pattern.png')
g<-ggplot(viz_df,aes(x=year,y=population,color=ageGroup))+
  geom_line()+
  labs(title='Time Pattern of Population in Different Age Groups',
       subtitle='from Intercensal Population dataset',
       y='Population',
       x='Year')
g
dev.off()

