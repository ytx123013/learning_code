# 遍历图像
###指针遍历

```
灰度图遍历
uchar *data = image.ptr<uchar>(i,j);

彩色图遍历
Vec3b *data = image.ptr<Vec3b>(i,j);
```
###迭代器遍历
可以使用 cv::Mat_<cv::Vec4b>::iterator 迭代器来进行遍历

```
Mat_<Vec4b>::iterator it = image.begin<Vec4b>();
Mat_<Vec4b>::iterator itEnd = image.end<Vec4b>();
while (it != itEnd) {
   (*it)[0] = 255;
   (*it)[1] = 255;
   (*it)[2] = 255;
   it++;
}
```
可以使用

```
it += 10
```
这种形式每次迭代移动10个像素位置

