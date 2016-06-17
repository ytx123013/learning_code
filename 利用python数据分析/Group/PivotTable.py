#coding=utf-8
import pandas as pd
import numpy as np
from pandas import DataFrame
from pandas import Series
from PrintGroupBy import print_groupyby_one
from PrintGroupBy import print_groupyby_two

tips = pd.read_csv('resources/tips.csv')
tips['tip_pct'] = tips['tip']/tips['total_bill']
# print tips[:5]

a = tips.pivot_table(index=['sex','smoker'],aggfunc='mean')
b = tips.pivot_table(['tip_pct'],index=['sex','smoker'],aggfunc='mean')
# 精细算出每个行和列中每个对应值的结果,和所有的结果
c = tips.pivot_table(['tip_pct'],index=['sex'],columns=['smoker'],aggfunc='mean',margins=True)
# print a
# print b
# print c


# crosstab
from StringIO import StringIO
data = """\
Sample    Gender    Handedness
1    Female    Right-handed
2    Male    Left-handed
3    Female    Right-handed
4    Male    Right-handed
5    Male    Left-handed
6    Male    Right-handed
7    Female    Right-handed
8    Female    Left-handed
9    Male    Right-handed
10    Female    Right-handed"""
data = pd.read_table(StringIO(data), sep='\s+')

tab = pd.crosstab(data.Gender,data.Handedness,margins=True)
# print tab