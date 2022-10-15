library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(plotly)
library(base)
library(dplyr)
library(plyr)
library(R3port)
library(htmltools)
###Initialize char vectors for file path as well as column names
user_char=c('04','05','06')
cate_char=list(c('01','02','03','04','05','06','07','08'),
               c('01','02','03','04','05','06','07','08'),
               c('01','02','03','04','05','06','07'))

rows=seq(as.Date("2012-06-27"), as.Date("2013-01-23"), by="days")
user_cols=list(c('Fridge','Kitchen Appliances','Lamp','Stereo and Laptop',
             'Freezer','Tablet','Entertainment','Microwave'),
             c('Tablet','Coffee Machine','Fountain','Microwave','Fridge',
               'Entertainment','PC','Kettle'),
             c('Lamp','Laptop','Router','Coffee Machine','Entertainment',
               'Fridge','Kettle'))

###Create the list for 3 dataframes, each containing data of power per day of
###different source for each user.

user_list = list()

for(i in 1:3){
  df_user=data.frame(matrix(nrow=length(rows),ncol=length(user_cols[[i]])))
  colnames(df_user)=user_cols[[i]]
  rownames(df_user)=rows
  
  for(j in 1:length(cate_char[[i]])){
    cur_path=paste('A5/eco/',user_char[i],'/',cate_char[[i]][j],sep='')
    
    file_list <- list.files(path=cur_path)
    file_list <- file_list[file_list %in% paste(row.names(df_user),'.csv',sep='')]
    
    cur_col=user_cols[[i]][j]
    
    for(k in 1:length(file_list)){
      cur_char = file_list[k]
      temp_file<-read.csv(paste(cur_path,cur_char,sep='/'),header=F)
      ####Only sum the measured values (Excluding the ones equal to -1)
      value = sum(temp_file[temp_file>0])
      key = substr(cur_char,start=1,stop=nchar(cur_char)-4)
      df_user[key,cur_col]=value
    }
  }
  
  user_list[[i]]=df_user
}

###Create Columns of days and dates
for(i in 1:3){
  dates = as.Date(rownames(user_list[[i]]))
  user_list[[i]]['Days']=as.numeric(dates-dates[1],unit='days')
  user_list[[i]]['Date']=dates
}

###Save our dataframes for Altair use
write.csv(user_list[[1]],'user1.csv',row.names=F)
write.csv(user_list[[2]],'user2.csv',row.names=F)
write.csv(user_list[[3]],'user3.csv',row.names=F)

###Create the configuration variable
updatemenus <- list(
  list(
    active = 0,
    type= 'buttons',
    buttons = list(
      list(
        label = "Fridge",
        method = "update",
        args = list(list(visible = c(FALSE,TRUE,TRUE,TRUE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE)),
                    list(title = "Fridge"))),
      list(
        label = "Kitchen Appliances",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Kitchen Appliances"))),
      list(
        label = "Lamp",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
                                     TRUE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Lamp"))),
      list(
        label = "Stereo and Laptop",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,TRUE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Stereo and Laptop"))),
      list(
        label = "Freezer",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,TRUE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Freezer"))),
      list(
        label = "Tablet",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,TRUE,TRUE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Tablet"))),
      list(
        label = "Entertainment",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     TRUE,TRUE,TRUE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Entertainment"))),
      list(
        label = "Microwave",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,TRUE,TRUE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Microwave"))),
      list(
        label = "Coffee Machine",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     TRUE,TRUE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Coffee Machine"))),
      list(
        label = "Fountain",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,TRUE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Fountain"))),
      list(
        label = "PC",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,TRUE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "PC"))),
      list(
        label = "Kettle",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,TRUE,
                                     TRUE,FALSE)),
                    list(title = "Kettle"))),
      list(
        label = "Laptop",
        method = "update",
        args = list(list(visible = c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,TRUE)),
                    list(title = "Laptop"))),
      list(
        label = "Router",
        method = "update",
        args = list(list(visible = c(TRUE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE,FALSE,FALSE,FALSE,
                                     FALSE,FALSE)),
                    list(title = "Router"))))
  )
)

###Create the plot
fig <- plot_ly(type = 'scatter',
               mode = 'line') %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[1]]$Fridge,name='Household1') %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[2]]$Fridge,name='Household2') %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[3]]$Fridge,name='Household3') %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[1]]$`Kitchen Appliances`,name='Household1',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[1]]$Lamp,name='Household1',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[3]]$Lamp,name='Household3',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[1]]$`Stereo and Laptop`,name='Household1',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[1]]$Freezer,name='Household1',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[1]]$Tablet,name='Household1',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[2]]$Tablet,name='Household2',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[1]]$Entertainment,name='Household1',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[2]]$Entertainment,name='Household2',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[3]]$Entertainment,name='Household3',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[1]]$Microwave,name='Household1',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[2]]$Microwave,name='Household2',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[2]]$`Coffee Machine`,name='Household2',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[3]]$`Coffee Machine`,name='Household3',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[2]]$Fountain,name='Household28',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[2]]$PC,name='Household2',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[2]]$Kettle,name='Household2',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[3]]$Kettle,name='Household3',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[3]]$Laptop,name='Household3',
    visible = F) %>%
  add_lines(
    x=user_list[[1]]$Date, y=user_list[[3]]$Router,name='Household3',
    visible = F) %>%
  layout(title = "Fridge", showlegend=T,
         xaxis=list(title="Date"),
         yaxis=list(title="Power (J)"),
         updatemenus=updatemenus)

###Save the interactive plot as a html file
fig$height=600
save_html(fig,'plotly.html')
###Merge two html files
rawHTML1 <- paste(readLines("plotly.html"), collapse="\n")
rawHTML2 <- paste(readLines("altair.html"), collapse="\n")
html_combine(list('temp1.html','plotly.html','temp2.html'),out='index.html',
             toctheme=TRUE)
