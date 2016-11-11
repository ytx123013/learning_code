# 关于cv::Mat
###Mat中的depth,dims,channels,step,data,elemSize
[引用自此处](https://www.douban.com/note/265479171/)
data:Mat对象中的一个指针，指向内存中存放矩阵数据的一块内存(uchar *data)
dims:Mat矩阵的维度, eg.3\*4的矩阵维度为2，3\*4\*5的矩阵维度为3
channels:通道，代表矩阵中每个元素拥有几个值。eg，3\*4的矩阵中共有12个元素，channel=3，代表每个元素有3个值，常用于RGB的3通道
depth:位深度，代表一个像素由几位构成
elemSize:表示矩阵中每一个元素的数据大小,CV_8U elemSize =1,CV_8UC3 elemSize=3

