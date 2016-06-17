#coding=utf-8
import pandas as pd
import numpy as np

from pandas import DataFrame
from pandas import Series

data = np.arange(1,101,0.5)

# 创建index
index = pd.Index(np.arange(0,200))
s = Series(data,index=index)
# print s

# 重新索引
s2 = s.reindex(np.arange(100,300))
# print s2

# 选择不存在值的填充方式
s3 = s.reindex(np.arange(180,220),method='ffill')
# print s3

# 删除指定的index项
s4 = s.drop(np.arange(0,20))
# print s4

dic = {
    'Nevada':{2001:2.4,2002:4.2,2003:1.2},
    'Ohio':{2000:1.1,2002:4.4,2001:5.2}
}
f = DataFrame(dic)
# print f
# 列名称
cols = f.columns
# 行名称
index = f.index
# print cols
# print index

# 判断2000是否在行名称中
print 2000 in index

# 重新设定dataframe的index
f2 = f.reindex([1999,2000,2001,2002])
# print f2
f3 = f.reindex(columns=['Nevada','Ohio','add'])
# print f3
f4 = f.reindex(index=[1999,2000,2001,2002],method='bfill',
               columns=['Nevada','Ohio','add'])
# print f4

# 删除指定项
f5 = f.drop([2001])
# print f5
f6 = f.drop(['Nevada'],axis=1)
print f6