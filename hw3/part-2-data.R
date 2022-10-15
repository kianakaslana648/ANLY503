library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(ggplot2)

### load white/black-hat files
df_white_hat <- read.csv('white-hat-data.csv')

df_black_hat <- read.csv('black-hat-data.csv')

### make the white/black-hat plots
png('white-hat-viz.png',width=1000,height=1000)
ggplot(df_white_hat,aes(x=Year,y=Value,fill=VAR))+
  geom_bar(stat="identity", position=position_dodge())+
  facet_wrap(~VAR,scales='free')+
  ggtitle('Change of GHG Emission from Different Sources in USA over the Past 30 Years')+
  ylab('Quantity')+labs(caption='Green house gas quantities computed in Tonnes of CO2 equivalent
  AGR = Agriculture
  ENER = Energy
  IND_PROC = Industrial processes and product use
  WAS = Waste')+
  theme(text = element_text(size = 20))
dev.off()

png('black-hat-viz.png',width=1000,height=1000)
ggplot(df_black_hat,aes(x='',y=perc,fill=Country))+
  geom_bar(stat="identity",width=1)+
  coord_polar('y')+
  facet_grid(~Year)+
  ggtitle('Changes of CO2 Emission Percentage in Northern European Countries')+
  xlab('')+
  ylab('Year')+
  theme(text = element_text(size = 20))
dev.off()
