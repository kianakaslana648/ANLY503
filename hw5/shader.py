import pandas as pd
import hvplot
import datashader
import fastparquet
import hvplot.xarray
import xarray as xr
import numpy as np


df=pd.read_csv('data/household_power_consumption.txt',sep=';',na_values='?')

df['datetime'] = pd.to_datetime(df['Date']+ ' ' + df['Time'])

df['Global_active_power'] = pd.to_numeric(df['Global_active_power'],errors='coerce')

df_xr = df.to_xarray()

figure = df_xr.hvplot.scatter(x='datetime',y='Global_active_power',groupby=[],datashade=True)

hvplot.show(figure)

df.to_parquet('power.parquet')