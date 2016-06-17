#coding=utf-8
import pandas as pd
import numpy as np
from pandas import DataFrame
from pandas import Series

data = {
    'line_01':['a','b','c','d'],
    'line_02':[1,2,3,4],
    'line_03':[4,3,2,1]
}
f = DataFrame(data)

# 列旋转为行,DataFrame->Series
f1 = f.stack()
# print f1
# 行旋转为列,Series->DataFrame
f2 = f1.unstack()
# print f2

f3 = pd.read_csv('rcs/macrodata.csv')
periods = pd.PeriodIndex(year=f3.year, quarter=f3.quarter, name='date')
f3 = DataFrame(f3.to_records(),
                 columns=pd.Index(['realgdp', 'infl', 'unemp'], name='item'),
                 index=periods.to_timestamp('D', 'end'))
ldata = f3.stack().reset_index().rename(columns={0: 'value'})
wdata = ldata.pivot('date', 'item', 'value')
# print ldata
# print wdata

data = DataFrame({'k1': ['one'] * 3 + ['two'] * 4,
                  'k2': [1, 1, 2, 3, 3, 4, 4]})
# 去除重复值
# data.duplicated()会返回一个Bool的Series,表示各行是否是重复值
s1 = data.duplicated()
f4 = data.ix[np.logical_not(s1),]
# print f4
# drop_dumplicates会直接返回一个除去重复值的DataFrame
f5 = data.drop_duplicates()
# print f5
# 指定按某列过滤,保留的值为最后一个
f6 = data.drop_duplicates(['k1'], keep='last')
# print f6


# 给DataFrame添加一列,使其对应,map可以替换原Series对应的数据
data = DataFrame({'food': ['bacon', 'pulled pork', 'bacon', 'Pastrami',
                           'corned beef', 'Bacon', 'pastrami', 'honey ham',
                           'nova lox'],
                  'ounces': [4, 3, 12, 6, 7.5, 8, 3, 5, 6]})
meat_to_animal = {
  'bacon': 'pig',
  'pulled pork': 'pig',
  'pastrami': 'cow',
  'corned beef': 'cow',
  'honey ham': 'pig',
  'nova lox': 'salmon'
}
data['animal'] = data['food'].map(str.lower).map(meat_to_animal)
# print data

# 更新索引标签
data1 = data.rename(index={1:'hehe'},columns={'food':'replaced'})
# print data1

# 替换replace
data = Series(np.arange(1,21),)
data1 = data.replace(5,100)
# print data1
data1 = data.replace([3,4,5],0)
# print data1
# 根据不同的值替换
data1 = data.replace({
    1:'one',
    2:'two'
})
# print data1

ages = np.arange(50)
# print ages
# 分割, right选择是左边包括还是右边包括
group_names = ['child','son','young','adult']
a = pd.cut(ages,[0,5,15,20,100],right=False,labels=group_names)
# print a
# print a.categories

# 选出含有超过3或-3的行
data = DataFrame(np.random.randn(1000,4))
a = data[(np.abs(data)>3).any(axis=1)]
# print a

# 重新随机排列
df = DataFrame(np.random.random(20).reshape(4,5))
df2 = np.random.permutation(df)
# print df
# print df2

# 哑变量
df = DataFrame({'key': ['b', 'b', 'a', 'c', 'a', 'b'],
                'data1': range(6)})
# print df
# print pd.get_dummies(df['key'])

# 属于多类型
mnames = ['movie_id', 'title', 'genres']
movies = pd.read_table('rcs/movies.dat', sep='::', header=None,
                        names=mnames,engine='python')
data = movies[:10]
genre_iter = (set(x.split('|')) for x in data.genres)
#
genres = set.union(*genre_iter)
dummies = DataFrame(np.zeros((len(data),len(genres))),columns=genres,index=[data['title']])

for title in data['title']:
    gen = data[data['title']==title]['genres'].iloc[0]
    dummies.ix[title,gen.split('|')] = 1
    # print title
# print data
# print dummies