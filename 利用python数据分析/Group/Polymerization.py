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

grouped = df.groupby('key1')
data1 = grouped['data1']
# print data1.quantile(0.9)
# print_groupyby_one(data1)

# 若需要使用自己的聚合函数,只需传入agg方法即可
def peak_to_peak(arr):
    return arr.max() - arr.min()
a = data1.agg(peak_to_peak)
# print a

tips = pd.read_csv('resources/tips.csv')
tips['tip_pct'] = tips['tip']/tips['total_bill']
print tips

grouped = tips.groupby(['sex','smoker'])
# print_groupyby_two(grouped)
grouped_pct = grouped['tip_pct']
# print_groupyby_two(grouped_pct)
group_mean = grouped_pct.agg('mean')
# print group_mean.unstack()
# 传入一组函数
group_func = grouped_pct.agg(['mean','std',peak_to_peak])
# print group_func
# 用自定义标签显示不同的函数名
group_func = grouped_pct.agg([('pingjunzhi','mean'),('biaozhuncha','std')])
# print group_func

# 不同列应用不同的函数
group_func = grouped.agg({'tip_pct':['min','max'],
                          'size':'sum'})
# print group_func

# 以'无索引'方式返回数据集合
group = tips.groupby(['sex','smoker'],as_index=False).mean()
# print group_mean
# print group