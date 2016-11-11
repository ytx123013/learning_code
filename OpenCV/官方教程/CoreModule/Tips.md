# cv::Mat_ 和 cv::Mat
Mat_是Mat的一个子类，在声明时就确定了数据类型，所以可以方便的使用一些方法
eg.

```
cv::Mat_<uchar> im2 = image;
im2(20,100) = 0;	
```


