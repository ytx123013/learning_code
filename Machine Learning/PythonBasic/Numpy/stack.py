#coding=utf-8
import numpy as np

# 多个数组的堆叠
a = np.arange(1,10).reshape((3,3))
b = np.arange(101,110).reshape((3,3))
c = np.arange(1001,1010).reshape((3,3))

print 'axis = 0 \n',np.stack((a,b,c),axis=0)
print 'axis = 1 \n',np.stack((a,b,c),axis=1)