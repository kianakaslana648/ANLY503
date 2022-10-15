import pandas as pd
import numpy as np
import altair as alt
import altair_viewer
alt.renderers.enable('html')

### You can rename this python file to avoid errors caused by loading altair package

### Before run this code, we should run plotly.r first
### I made use of the datasets for 3 households created there.
user1 = pd.read_csv('user1.csv')
user2 = pd.read_csv('user2.csv')
user3 = pd.read_csv('user3.csv')


### Preprocess the dataset(removing useless columns, computing percentages, creating the final dataframe by merging
### small ones)
result1=np.sum(user1.iloc[:,0:8],axis=0)
result1=result1/np.sum(result1)

result2=np.sum(user2.iloc[:,0:8],axis=0)
result2=result2/np.sum(result2)

result3=np.sum(user3.iloc[:,0:7],axis=0)
result3=result3/np.sum(result3)

plot1=pd.DataFrame({'Type':result1.index,'Percentage':result1})
plot2=pd.DataFrame({'Type':result2.index,'Percentage':result2})
plot3=pd.DataFrame({'Type':result3.index,'Percentage':result3})
plot1['Household']=['Household1']*8
plot2['Household']=['Household2']*8
plot3['Household']=['Household3']*7

final_df=pd.concat([pd.concat([plot1, plot2], axis=0),plot3],axis=0)

### Use altair to create the plot for power use percentages of different households
input_dropdown = alt.binding_select(options=['Household1','Household2','Household3'], name='Household')
selection = alt.selection_single(fields=['Household'], bind=input_dropdown)

final=alt.Chart(final_df,title='Percentages for Different Power Use in 3 Households').mark_bar().encode(
    x='Type:N',
    y='Percentage:Q'
).add_selection(
    selection
).transform_filter(
    selection
).properties(
    width=400,
    height=400
).configure_axis(
    labelFontSize=16,
    titleFontSize=20
).configure_title(fontSize=24)

### Save the interactive plot to a html file
final.save('Altair.html')
