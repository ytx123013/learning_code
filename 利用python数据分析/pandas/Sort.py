#coding=utf-8
import pandas as pd
import numpy as np

from pandas import DataFrame
from pandas import Series

dic = {
    'line01':np.arange(20,40),
    'line03':np.linspace(30,35,20),
    'line02':np.arange(80,60,-1)
}
f = DataFrame(dic,index=np.arange(100,80,-1))

# 按行索引由小到大排序
a = f.sort_index()
# print a
# 按列索引排序
b = f.sort_index(axis=1)
# print b
# 倒序
c = f.sort_index(axis=1,ascending=False)
# print c

# 根据某列排序
e = f.sort_values(by='line02')
print e
# 根据多列排序,即第一列相等时根据第二列排序,以此类推
g = f.sort_values(by=['line03','line02'])
# print g