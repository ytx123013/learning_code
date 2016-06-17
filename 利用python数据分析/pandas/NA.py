#coding=utf-8
import pandas as pd
import numpy as np

from pandas import DataFrame
from pandas import Series

s = Series([5,1,8,np.nan,2,4,9,10])

# 判断是否是Na
a = s.isnull()
# print a

# 去除NA
a = s.dropna()
b = s[s.notnull()]
# print a
# print b

f = DataFrame([[1,6,8],[2,np.nan,np.nan],[10,np.nan,3],[np.nan,np.nan,np.nan]])

# 去除带NA的行和列
a = f.dropna()
# print a
# 去除全为NA的行
b = f.dropna(how='all')
# print b

# 缺省值带填充
a = f.fillna(0)
# print a
# 对不同列填充不同带值
b = f.fillna({0:0.1,1:0.2,2:.3})
# print b
