#coding=utf-8
import numpy as np
"""
Basic Operation
"""
# 全体数据加1
a = np.array([1,2,3,4,5])
# print a 
c = a + 1
# print c

# 两个array中对应数据操作
a = np.array([1,2,3,4,5])
b = np.ones(5 ,dtype = int)
c = a - b
d = a * b
# print c
# print d

# array中类型转换
# 具体类型见 md文件
str_a = a.astype(np.string_)
# print str_a

# Matrix 相乘
a = np.diag(np.arange(1,5))
b = a.dot(a)
c = np.dot(a,a)
# print a
# print b
# print c

# 比较两array 中各个元素关系
a = np.array([1,2,3,4])
b = np.array([4,3,2,1])
m = a == b
n = a > b
# print m
# print n
c = np.array([1,2,3,4])
m = np.array_equal(a,b)				#False
n = np.array_equal(a,c)				#True
# print m			
# print n

# 逻辑判断
a = np.array([1,1,0,0], dtype = bool)
b = np.array([1,0,0,1], dtype = bool)
c = np.logical_and(a,b)
d = np.logical_or(a,b)
e = np.logical_not(a)
f = np.logical_xor(a,b)
# print c,d,e,f

a = np.arange(1,5)
b = np.sin(a)
c = np.cos(a)
d = np.log(a)
e = np.exp(a)

# 矩阵转置
a = np.triu(np.ones((3,3)),1)
b = a.T
# print a
# print b

# 求矩阵内积
a = np.arange(15).reshape((3,5))
b = np.dot(a.T,a)
# print b

# 算和
a = np.array([1,2,3,4])
b = np.sum(a)
c = a.sum()
# print b,c

# 二维数组算和
a = np.array([[1,2],[3,4]])

b = a[:,0].sum()		#第一列
c = a[:,1].sum()		#第二列
e = a[0,:].sum()		#第一行
f = a[1,:].sum()		#第二行


# 一些其他操作
a = np.arange(10)
b = a.min()
c = a.max()
d = a.argmin()			#最小值的下标
e = a.argmax()			#最大值的下标

# 统计学相关
a = np.array([1,2,3,4,5,6,7,8,9])
b = a.mean()
c = np.median(a)
d = a.std()

# 降维
a = np.array([[1,2,3],[4,5,6]])
b = a.ravel()
# print a,b

# 重新排列
a = np.array([[1,2,3],[4,5,6]])
b = a.shape
# print a
# print b
c = a.ravel()
c = c.reshape((3,2))
# print c
d = c.reshape((3,-1))		#-1 表示智能分配
# print d


# 增加一个维度
a = np.array([1,2,3,4,5])
b = a[:,np.newaxis]
c = a[np.newaxis,:]

# 排序
a = np.array([[3,6,1],[5,1,7]])
# print a
b = np.sort(a)
# print b
c = np.argsort(a)		#获取排列好的数据在原数据的下标
# print c


# 找到array中符合某条件的数组 
a = np.arange(1,100)
b = a[np.logical_and(a>50,a<70)]
c = a[a > 50]
# print a
# print b
# print c











