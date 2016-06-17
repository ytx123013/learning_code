#coding=utf-8
import pandas as pd
import numpy as np
from pandas import DataFrame

df1 = DataFrame({
    'key':['b','b','a','a','c','d','a','c','c'],
    'data1':np.arange(9)
})
df2 = DataFrame({
    'key':['a','b','c','e'],
    'data2':[100,101,102,103]
})

# 交集合并
df3 = pd.merge(df1,df2,on='key')
print df3

# 并集合并
df4 = pd.merge(df1,df2,how='outer')
print df4