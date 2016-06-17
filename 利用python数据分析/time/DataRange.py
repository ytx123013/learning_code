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

# 日期范围
index = pd.date_range(start='2011-1-1',end='2011-2-1')
# print index
index = pd.date_range('2010-1-1 12:12:12',periods=30)
# print index


# 频率和日期偏移量
from pandas.tseries.offsets import Hour, Minute
# 间隔频率为4小时
date = pd.date_range('2000 1 1','2000 1 5',freq='4h')
# print date
# 间隔频率为1小时30分
date = pd.date_range('2000 1 1','2000 1 5',freq='1h30min')
# print date

# 移动数据
# shift可以沿时间轴前移或后移
ts = Series(np.random.randn(4),
            index=pd.date_range('1/1/2000', periods=4, freq='M'))

# 移动数据
lagging_ts = ts.shift(2)
leading_ts = ts.shift(-2)
# print ts
# print lagging_ts
# print leading_ts

# 移动时间index ,按月份移动
shift_ts = ts.shift(2, freq='M')
# print ts
# print shift_ts

# 通过偏移量对日期位移
hours_3 = Hour(3)
now = datetime.now()
three_hours_later = now + hours_3
# print three_hours_later
