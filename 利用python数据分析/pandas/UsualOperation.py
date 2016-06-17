#coding=utf-8
import pandas as pd
import numpy as np

from pandas import DataFrame
from pandas import Series

data = np.arange(100,80,-1)
s = Series(data)
dic = {
    'line01':np.arange(20,40),
    'line02':np.arange(80,60,-1),
    'line03':np.linspace(30,35,20)
}
f = DataFrame(dic)

# Series
# 选取Series中的值
a = s[1]
b = s[[1,2,3]]
c = s[1:3]
d = s[s < 90]
# print a
# print b
# print c
# print d

# DataFrame
# 获取列
a = f['line01']
b = f[['line02','line03']]
# print a
# print b

# 获取行
a = f[:10]
b = f[f['line02']>70]
c = f.ix[5:10,:]
d = f.ix[[3,6,11],:]
e = f.ix[:,:1]
g = f.ix[:,'line01']
h = f.ix[:,['line01','line03']]
i = f.ix[f.line01>30,:]
# print a
# print b
# print c
# print d
# print e
# print g
# print h
# print i

# 获取行数
len(f.index)



# 运算  DataFrame同理
s1 = Series(np.arange(10,20),index=np.arange(0,10))
s2 = Series(np.arange(50,60),index=np.arange(5,15))
s3 = s1 + s2
# 对原本没有的值进行填充
s4 = s1.add(s2,fill_value = 0)
# print s3
# print s4

# Series 与 DataFrame的运算
s1 = f.ix[0,:]
# DataFrame会每行都根据索引减去series中相应的值
f1 = f - s1
# print f1
# 若需要按列运算,需指定axis轴
s1 = f.ix[:,0]
f1 = f.add(s1,axis = 0)
print f1