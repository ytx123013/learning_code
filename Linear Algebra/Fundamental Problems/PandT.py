#coding=utf-8
import numpy as np

a = [[2, -1, 1],
     [-1, 1, -1]]
a = np.array(a)

# 转置
t = a.T
# print a
# print t

# 对称矩阵
X = np.random.rand(5**2).reshape(5, 5)
# 取上三角部分  下三角为numpy.triu()
X = np.triu(X)
X += X.T - np.diag(X.diagonal())
# print X
# print X.T == X

# 或者将一个矩阵与其转置矩阵相乘即可得到对称矩阵
X = np.random.rand(5*2).reshape(2, 5)
X = np.dot(X.T,X)
# print X