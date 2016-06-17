#coding=utf-8
import pandas as pd
import numpy as np

from pandas import Series

a = np.arange(101,201)

# 简单创建
s = Series(a)
# print s

# 创建带索引数据
i = np.arange(1,101)
s = Series(a, index=i)
# print s

# 根据index选取值
i = ['a','b','c','d','e','f','g']
s = Series(np.arange(0,7),index=i)
obj = s['e']
objs = s[['b','a','d']]
# print obj
# print objs

# 根据在Series中位置取值
s[0] = 3
a = s.iloc[0]
# print a

# Series可以运用numpy运算
s2 = s*2
# print s2
s3 = s[s>3]
# print s3

# 用dic创建Series
dic = {
    'name':'ytx',
    'age':15,
    'sex':'man'
}
s = Series(dic)
# print s

# 传入一个list当键
l = ['name','sex','grade']
s1 = Series(dic,l)
# print s1

# 检查是否为空值
r = s1.isnull()
r1 = s1.notnull()
# print r
# print r1

# 相加使得相同索引的数据相加
s2 = s + s1
# print s2



# 给Series赋值名字
s.name = 'series_name'
s.index.name = 'series_index_name'
# print s


