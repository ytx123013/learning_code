# 模糊
smoothing操作也称为blurring，也就是模糊
操作原理就相当于设定一个kernel并进行临域操作。

# 常用的模糊操作

## 低通滤波器
Notmalized Box Filter，即kernel全为1，计算取平均值
Gaussian Filter，即kernel符合高斯分布

## 非线性滤波器
Median Filter，即取范围内的中位数
可以有效的去除椒盐噪点

Bilateral Filter


