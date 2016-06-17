#coding=utf-8
from pandas import DataFrame
from pandas import Series
import numpy as np

# 创建
data = {
    'line_01':np.arange(100),
    'line_02':np.arange(120,20,-1),
    'line_03':np.arange(60,160)
}
f = DataFrame(data)
# print f

# 指定列顺序
f = DataFrame(data,columns=['line_03','line_01','line_04','line_02'],index=np.arange(40,140))
# print f

# 根据列名取一列
l = f['line_03']
# print l
l = f.line_02
# print l



# 根据行索引取值
r = f.ix[100]
# print r

# 给一列赋值
f['line_04'] = 1
# print f
f['line_04'] = np.arange(70,170)
# print f
s = Series(np.arange(0,40,.5),index=np.arange(40,120))
f['line_04'] = s
# print f

# 创建和删除一列
f['line_05'] = f.line_01 > 20
# print f
del f['line_05']
# print f

# 嵌套字典,外层字典的键作为列,内层字典的键作为行索引
dic = {
    'Nevada':{2001:2.4,2002:4.2,2003:1.2},
    'Ohio':{2000:1.1,2002:4.4,2001:5.2}
}
f = DataFrame(dic)
# print f
# 转置
f1 = f.T
# print f1

# 以二维ndarray形式返回
f1 = f.values
# print f1