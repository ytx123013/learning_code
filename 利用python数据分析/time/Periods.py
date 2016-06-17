#coding=utf-8
from datetime import datetime
from datetime import timedelta
from dateutil import parser
from pandas import Series
from pandas import DataFrame
import pandas as pd
import numpy as np

# period 表示时间区间
p = pd.Period(2007,freq = 'A-DEC')
# print p

p = pd.period_range('2000-1-1','2016-1-1',freq='M')
print p