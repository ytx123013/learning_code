#coding=utf-8
"""
多项式表达
"""
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0,10,200)
y = np.cos(x)
# plt.plot(x,y,'o')
# plt.show()

"""
读取文件
"""
# image
img = plt.imread('lisanlianxu.png')
plt.imshow(img)
plt.savefig('xxx.png')
plt.imsave()


# 文本文件存取
data = np.loadtxt('source_file')
np.savetxt('des_file',data)

