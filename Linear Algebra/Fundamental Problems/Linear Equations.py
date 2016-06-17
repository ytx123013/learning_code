#coding=utf-8
import numpy as np

# 3 equations 3 unknowns
# 2x - y + z= 0
# -x + y - z= 3
# x + y + z= 4
# 先构成系数矩阵
a = [[2,-1,1],
     [-1,1,-1],
     [1,1,1]]
a = np.array(a)
# 构成等号右边的向量
b = np.array([0,3,4])
# 求解
s = np.linalg.solve(a,b)
# 矩阵与向量相乘
c = np.dot(a,s)
c = c.astype(np.int)        #类型转换
# print s
# print c


# 求逆矩阵
a = [
     [1,3],
     [2,7]
]
inverse_a = np.linalg.inv(a)
# print a
# print inverse_a