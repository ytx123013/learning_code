# Laplace
Sobel算子的基础来自于一个事实，即存在边缘，像素值出现"跳跃"或较大的变化，会看到极值的现象，即
![image](./imgs/1.png)
如果在边缘部分求二阶导数
![image](./imgs/2.png)
在一阶导数的极值位置，二阶导数为0。所以可以利用这个特点作为检测图像的边缘办法。
由于Laplacian函数使用了图像地图，它内部调用了Sobel方法。

