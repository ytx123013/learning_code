#coding=utf-8
import pandas as pd
import numpy as np
from pandas import DataFrame
from pandas import Series
from PrintGroupBy import print_groupyby_one
from PrintGroupBy import print_groupyby_two

df = DataFrame({'key1': ['a', 'a', 'b', 'b', 'a'],
                'key2': ['one', 'two', 'one', 'two', 'one'],
                'data1': np.random.randn(5),
                'data2': np.random.randn(5)})

# print df
# 为df添加两列,为根据key1分组,data1和date2的平均值
means_1 = df.groupby('key1').mean().add_prefix('mean_')
df1 = pd.merge(df,means_1,left_on='key1',right_index=True)
# print df
# print df1
# transform会讲一个函数应用到各个分组,然后将结果放置到适当的位置上
df1 = df.groupby('key1').transform(np.mean).add_prefix('mean_')
df2 = df.merge(df1,left_index=True,right_index=True)
# print df2


# apply()
tips = pd.read_csv('resources/tips.csv')
tips['tip_pct'] = tips['tip']/tips['total_bill']
# print tips

def top(df, n=5, column='tip_pct'):
    return df.sort_values(by=column,ascending=False)[:n]
a = tips.groupby('smoker').apply(top,10)
# 去掉分组的键
b = tips.groupby('smoker', group_keys=False).apply(top,10)
# print a
# print b


frame = DataFrame({'data1': np.random.randn(1000),
                   'data2': np.random.randn(1000)})
factor = pd.cut(frame.data1,4)
grouped = frame.data2.groupby(factor)
# print_groupyby_one(grouped)