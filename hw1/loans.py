import pandas as pd

loans=pd.read_csv('data/loans.csv')

tidy_loans=pd.melt(loans,id_vars=['id','account_id','date','amount','payments'])
tidy_loans=tidy_loans.loc[tidy_loans.loc[:,'value']!='-',]
temp=tidy_loans.variable.str.split('_')
month=temp.str.get(0)
status=temp.str.get(1)
tidy_loans['month']=month
tidy_loans['status']=status
tidy_loans=tidy_loans.drop(columns=['variable','value'])
tidy_loans.to_csv('loans_py.csv',index=False)