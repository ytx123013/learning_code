#coding=utf-8
from datetime import datetime
from datetime import timedelta
from dateutil import parser
from pandas import Series
from pandas import DataFrame
import pandas as pd
import numpy as np
from numpy.random import randn

rng = pd.date_range('1/1/2000', periods=100, freq='D')
ts = Series(randn(len(rng)), index=rng)
mean = ts.resample('M').mean()
# print mean


# 降采样 以频率为5min 方法为求和进行降采样
rng = pd.date_range('1/1/2000', periods=12, freq='T')
ts = Series(np.arange(12), index=rng)
# print ts
a = ts.resample('5min').sum()
# print a
a = ts.resample('5min',closed='right',label='right').sum()
# print a

# OHLC重采样
a = ts.resample('5min',closed='right',label='right').ohlc()
# print a

# 用groupby重采样
rng = pd.date_range('1/1/2000', periods=100, freq='D')
ts = Series(np.arange(100), index=rng)
a = ts.groupby(lambda x: x.month).mean()
# print a
a = ts.groupby(lambda x: x.weekday).mean()
# print a


# 升采样  会引入缺失值
frame = DataFrame(np.random.randn(2, 4),
                  index=pd.date_range('1/1/2000', periods=2, freq='W-WED'),
                  columns=['Colorado', 'Texas', 'New York', 'Ohio'])
df = frame.resample('D').sum()
# print df
# 填充缺省值
df = frame.resample('D').ffill(limit=3)
# print df

