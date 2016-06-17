#coding=utf-8
import numpy as np
import matplotlib.pyplot as plt

# 1维数组
a = np.array([0,1,2,3,4,5,6,7,8,9])
# print a

# 2维数组
b = np.array([[0,1,2],[3,4,5]])
# print b
# print b[0]
# 数组规模
c = b.shape
# print c

#creating arrays
# 按步长生成
a = np.arange(10)
# print a
b = np.arange(1,9,2)
# print b

# 按两个值之间平分成多少份生成
a = np.linspace(0, 1, 6)
# print a
# 不含末尾的点
b = np.linspace(0, 1, 5, endpoint = False)
# print b

# 2维数组
a = np.ones((3,3))
# print a
b = np.zeros((2,2))
# print b
c = np.eye(3)
# print c
d = np.diag(np.arange(1,5))
# print d

# 生成随机数
# 设置seed 相同的seed会生成同样的随机数
np.random.seed(12324)
# 生成4个 0到1之间的数
a = np.random.rand(4)
# print a
# 正态分布
b = np.random.randn(4)
# print b

# 设置不同的数据类型
a = np.array([1, 2, 3])
# print a
# print a.dtype
b = np.array([1, 2, 3], dtype=float)
# print b

"""
简单的数据显示
"""
x = np.linspace(0, 10, 20)
y = np.linspace(0, 90, 20)
# plt.plot(x, y)				#线图
# plt.plot(x, y, 'o')			#点图
# plt.show()

# 显示2维数据(图像)
image = np.random.rand(30, 30)
# plt.imshow(image, cmap=plt.cm.hot)
# plt.colorbar()					#色条
# plt.show()

# 判断两个 array 是否是一个内存
a = np.array([1,2,3,4])
b = a
c = a.copy()
is_share = np.may_share_memory(a,b)			#true
is_share2 = np.may_share_memory(a,c)		#false


