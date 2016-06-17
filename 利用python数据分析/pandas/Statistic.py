#coding=utf-8
import pandas as pd
import numpy as np

from pandas import DataFrame
from pandas import Series


data = np.arange(100,80,-1)
s = Series(data)
dic = {
    'line01':np.arange(20,40),
    'line03':np.linspace(30,35,20),
    'line02':np.arange(80,60,-1)
}
f = DataFrame(dic,index=np.arange(100,80,-1))
f2 = DataFrame({'line03':np.linspace(30,35,10),'line04':np.arange(10)},index=np.arange(100,90,-1));
f3 = f.add(f2)
# 求和
# 求每一列的和
sum = f.sum()
# 求指定列的和
sum1 = f[['line01','line02']].sum()
# 求每一行的和
sum2 = f.sum(axis=1)
# print sum
# print sum1
# print sum2
# 若该行或列有NaN则运行结果为NaN,默认skipna为True,忽略NaN
sum4 = f3.sum(skipna=False)
# print sum4

# 获取所有值
S2 = Series(['c','d','a','c','c','c','r','a','d'])
uniques = S2.unique()
# print uniques
# 获取每个值出现的次数
uniques_counts = S2.value_counts()
# print uniques_counts

# 获取DataFrame中多个列出现的信息
result = f.apply(pd.value_counts).fillna(0)
print result

