#coding=utf-8
import pandas as pd
import numpy as np

from pandas import DataFrame
from pandas import Series

data = Series(np.random.randn(10),
              index=[['a','a','a','a','b','b','b','b','c','c'],[1,2,3,1,2,3,1,2,3,4]])
# print data.index


# 用外层index选取
a = data['a']
# print a
# 用内层index选取
b = data[:,1]
# print b



f = DataFrame({'a':range(7),'b':range(7,0,-1),
               'c':['a','b','c','d','e','f','g',],
               'd':[1,2,1,2,1,2,1]})


# 将一列或多列转为行索引
f2 = f.set_index(['d','c'])
# print f2
# 将索引列留存下来
f3 = f.set_index(['b','c'],drop=False)
# print f3
