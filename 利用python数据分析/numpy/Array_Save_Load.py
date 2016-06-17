#coding=utf-8
import numpy as np

#以二进制文件存 .npy为未压缩
a = np.arange(20)
np.save('save01',a)

#以二进制文件取
b = np.load('save01.npy')
# print b

#将多个数组压缩后保存 .npz
a1 = np.arange(20)
b1 = np.arange(20,40)
np.savez('save02',a=a1,b=b1)
#取
data = np.load('save02.npz')
a1 = data['a']
b1 = data['b']
# print a1,b1

