#coding=utf-8
from datetime import datetime
from datetime import timedelta
from dateutil import parser
from pandas import Series
from pandas import DataFrame
import pandas as pd
import numpy as np


from datetime import datetime
dates = [datetime(2011, 1, 2), datetime(2011, 1, 5), datetime(2011, 1, 7),
         datetime(2011, 1, 8), datetime(2011, 1, 10), datetime(2011, 1, 12)]
ts = Series(np.random.randn(6), index=dates)
# print ts


# 选取
str = ts.index[2]
time = ts[str]
# print time
# 通过日期选取
time = ts['2011-1-10']
# print time

# 子集构造  传入'年'或'年月'即可
longer_ts = Series(np.random.randn(1000),
                   index=pd.date_range('1/1/2000', periods=1000))
# print longer_ts
time_2000 = longer_ts['2000']
# print time_2000
time_2000_1 = longer_ts['2000-01']
# print time_2000_1
# 通过日期
time_range = longer_ts['2001-01-20':'2001-02-20']
# print time_range


# DataFrame
dates = pd.date_range('1/1/2000', periods=100, freq='W-WED')
df = DataFrame(np.random.randn(100, 4),
                    index=dates,
                    columns=['Colorado', 'Texas', 'New York', 'Ohio'])
# print df
time_2000 = df.ix['2000']
# print time_2000
time_2000_1 = df.ix['2000-01']
# print time_2000_1
time_range = df.ix['2001-01-20':'2001-02-20']
# print time_range

# 对于具有非唯一时间戳的数据进行数据聚合,办法是使用groupby并传入level=0(索引的唯一一层)
dates = pd.DatetimeIndex(['1/1/2000', '1/2/2000', '1/2/2000', '1/2/2000',
                          '1/3/2000'])
dup_ts = Series(np.arange(5), index=dates)
# print dup_ts
grouped = dup_ts.groupby(level=0)
# print grouped.count()