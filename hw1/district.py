import pandas as pd

district=pd.read_csv('data/districts.csv')
temp=district['municipality_info'].str[1:-1].str.split(',')
temp1=temp.str.get(0)
temp2=temp.str.get(1)
temp3=temp.str.get(2)
temp4=temp.str.get(3)

district['Population<500']=temp1
district['Population_500-1999']=temp2
district['Population_2000-9999']=temp3
district['Population>=10000']=temp4
district=district.drop(columns=['municipality_info'])

temp=district['unemployment_rate'].str[1:-1].str.split(',')
temp1=temp.str.get(0)
temp2=temp.str.get(1)
district['unemployment_rate_95']=temp1
district['unemployment_rate_96']=temp2
district=district.drop(columns=['unemployment_rate'])

temp=district['commited_crimes'].str[1:-1].str.split(',')
temp1=temp.str.get(0)
temp2=temp.str.get(1)
district['crime_rate_95']=temp1
district['crime_rate_96']=temp2
district=district.drop(columns=['commited_crimes'])

district.to_csv("district_py.csv",index=False)