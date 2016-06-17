#coding=utf-8
from datetime import datetime
from datetime import timedelta
from dateutil import parser
from pandas import Series
from pandas import DataFrame
import pandas as pd
import numpy as np
from numpy.random import randn
import matplotlib.pyplot as plt

close_px_all = pd.read_csv('resources/stock_px.csv', parse_dates=True, index_col=0)
# print close_px_all['AAPL']
# print close_px_all

# close_px_all['AAPL'].plot()
# plt.show()

# 绘制2009年的数据
# close_px_all['2009'].plot()
# plt.show()

# 绘制AAPL在2011年1月到3月的数据
close_px_all['AAPL'].ix['2011-1':'2011-3'].plot()
plt.show()