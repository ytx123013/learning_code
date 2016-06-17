#coding=utf-8
import pandas as pd
from pandas import Series
import numpy as np
import csv
import sys

# 读取csv文件内容
df = pd.read_csv('resources/hospital-data.csv',sep=',')
df1 = pd.read_table('resources/hospital-data.csv',sep=',')

# 对于没有列名称的文件
df2 = pd.read_csv('resources/ex2.csv',header=None)
names = ['a','b','c','d','message']
df3 = pd.read_csv('resources/ex2.csv',names=names)

# 读取文件并以其中一列为索引
df4 = pd.read_csv('resources/ex2.csv',names=names,index_col='message')
# print df4
# 以多列作为索引
df5 = pd.read_csv('resources/ex2.csv',names=names,index_col=['message','a'])
# print df5

# 文件以不定数量个空格做分隔符,可以用正则表达式\s+
df6 = pd.read_csv('resources/ex3.csv',sep='\s+')
# print df6

# 读取带缺失值带文件
df7 = pd.read_csv('resources/ex4.csv',names=names)
# print df7

# 为不同带列指定不同的Na标记,即将不同列的指定值视为NaN
sentinels={'c':[11],'message':['ppp']}
df8 = pd.read_csv('resources/ex4.csv',names=names,na_values=sentinels)
# print df8
# 将整个数据中的指定值视为NaN
df9 = pd.read_csv('resources/ex4.csv',names=names,na_values=['sss'])
# print df9

# 指定读取的行数
df10 = pd.read_csv('resources/ex5.csv',nrows=10)
# print df10

# 写入csv,缺省值写成NaN,行标签不写入文件,列标签为header
df7.to_csv('resources/write1.csv',sep=',',na_rep='Nan',index=False)

# 按指定顺序写入指定列
df7.to_csv('resources/write1.csv',sep=',',na_rep='Nan',index=False,columns=['b','c','a'])


# Serises的读写
dates1 = pd.date_range('1/1/2000','1/1/2016')
s = Series(dates1,index=np.arange(dates1.size))
# print s
s.to_csv('resources/write2.csv',sep=',')
s1 = Series.from_csv('resources/write2.csv')
# print s1

# csv
f = open('resources/write1.csv')
reader = csv.reader(f)
lines = list(reader)
header,values = lines[0],lines[1:]
data_dic = {
    k:v for k,v in zip(header,zip(*values))
}
# print data_dic

