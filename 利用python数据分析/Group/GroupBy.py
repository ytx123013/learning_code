#coding=utf-8
import pandas as pd
import numpy as np
from pandas import DataFrame
from pandas import Series

df = DataFrame({'key1': ['a', 'a', 'b', 'b', 'a'],
                'key2': ['one', 'two', 'one', 'two', 'one'],
                'data1': np.random.randn(5),
                'data2': np.random.randn(5)})
# print df
# 按key1分组并计算data1的平均值
group = df['data1'].groupby(df['key1'])
group_mean = group.mean()
# print group_mean
# 传入根据多列分组
group_mean = df['data1'].groupby([df['key1'],df['key2']]).mean()
# print df
# print group_mean.unstack()
# 或者直接用列名做key
group_mean = df.groupby(['key1','key2']).mean()
# print group_mean

# 计算分组长度
size = df.groupby(['key1','key2']).size()
# print size.unstack()

# 迭代
for name,group in df.groupby('key1'):
    a = 1
    # print 'name :\n',name
    # print 'data :\n',group
# 多列分组
for (k1,k2),group in df.groupby(['key1','key2']):
    a = 1
    # print 'name :\n',k1,' ',k2
    # print 'data :\n',group

# 将分组转换为字典
dic = dict(list(df.groupby(['key1','key2'])))
# print dic[('a','one')]

# 选取一个或一组列
a = df.groupby('key1')['data1']
# 等同于
a = df['data1'].groupby(df['key1'])

# 通过字典或Series进行分组
people = DataFrame(np.random.randn(5, 5),
                   columns=['a', 'b', 'c', 'd', 'e'],
                   index=['Joe', 'Steve', 'Wes', 'Jim', 'Travis'])
people.ix[2:3, ['b', 'c']] = np.nan
mapping = {'a': 'red', 'b': 'red', 'c': 'blue',
           'd': 'blue', 'e': 'red', 'f': 'orange'}
row_sum = people.groupby(mapping, axis=1).sum()
# print row_sum
map_series = Series(mapping)
group_count = people.groupby(map_series,axis=1).count()
# print group_count


# 根据索引级别
columns = pd.MultiIndex.from_arrays([['US', 'US', 'US', 'JP', 'JP'],
                                     [1, 3, 5, 1, 3]], names=['cty', 'tenor'])
hier_df = DataFrame(np.random.randn(4, 5), columns=columns)
# print hier_df.groupby(level='cty', axis=1).count()
