import pandas as pd

accounts=pd.read_csv('data/accounts.csv')
cards=pd.read_csv('data/cards.csv')
clients=pd.read_csv('data/clients.csv')
districts=pd.read_csv('data/districts.csv')
links=pd.read_csv('data/links.csv')
loans=pd.read_csv('loans_py.csv')
payment_orders=pd.read_csv('data/payment_orders.csv')
transactions=pd.read_csv('data/transactions.csv')

tidy_acc=accounts
tidy_acc.columns=['account_id','district_id','open_date','statement_frequency']

tidy_dis=districts.loc[:,['id','name']]
tidy_dis.columns=['district_id','district_name']

temp=links.groupby('account_id').size()
tidy_links=pd.DataFrame(temp)
tidy_links.columns=['num_customers']
tidy_links['account_id']=temp.index

temp_links=links.loc[:,['client_id','account_id']]
temp_cards=cards.loc[:,['id','link_id']]
temp_cards.columns=['id','client_id']
temp=temp_links.join(temp_cards.set_index('client_id'), on='client_id')

temp=temp.loc[~temp.id.isna(),:]
temp_tab=temp.groupby('account_id').size()
temp_credit=pd.DataFrame(temp_tab)
temp_credit.columns=['credit_cards']
temp_credit['account_id']=temp_credit.index


tidy_loans=loans.drop(columns=['id','date'])
tidy_loans.columns=['account_id','loan_amount','loan_payments','loan_term','loan_status']
tidy_loans['loan_default']=tidy_loans['loan_status']=='B'
has_loan=tidy_acc['account_id'].isin(tidy_loans['account_id'])

tidy_wit=transactions.loc[transactions['type']=='credit',:]
tidy_wit=tidy_wit.loc[:,['account_id','amount']]
wit_max=pd.DataFrame(tidy_wit.groupby('account_id').max())
wit_min=pd.DataFrame(tidy_wit.groupby('account_id').min())
wit_cc=pd.DataFrame(tidy_wit.groupby('account_id').size())
wit_max.columns=['max_withdrawal']
wit_min.columns=['min_withdrawal']
wit_cc.columns=['cc_payments']
wit_max['account_id']=wit_max.index
wit_min['account_id']=wit_min.index
wit_cc['account_id']=wit_cc.index

tidy_bal=transactions.loc[:,['account_id','balance']]
bal_max=pd.DataFrame(tidy_bal.groupby('account_id').max())
bal_min=pd.DataFrame(tidy_bal.groupby('account_id').min())
bal_max.columns=['max_balance']
bal_min.columns=['min_balance']
bal_max['account_id']=bal_max.index
bal_min['account_id']=bal_min.index

final_df=tidy_acc.join(tidy_dis.set_index('district_id'), on='district_id')
final_df=final_df.drop(columns=['district_id'])
final_df=final_df.join(tidy_links.set_index('account_id'), on='account_id')
final_df.loc[final_df['num_customers'].isna(),'num_customers']=0
final_df=final_df.join(temp_credit.set_index('account_id'), on='account_id')
final_df.loc[final_df['credit_cards'].isna(),'credit_cards']=0
final_df['loan']=has_loan
final_df=final_df.join(tidy_loans.set_index('account_id'), on='account_id')
final_df=final_df.join(wit_max.set_index('account_id'), on='account_id')
final_df=final_df.join(wit_min.set_index('account_id'), on='account_id')
final_df=final_df.join(wit_cc.set_index('account_id'), on='account_id')
final_df=final_df.join(bal_max.set_index('account_id'), on='account_id')
final_df=final_df.join(bal_min.set_index('account_id'), on='account_id')

final_df.to_csv('analytical_py.csv',index=False)