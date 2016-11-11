# 傅立叶变换
使用傅立叶过程
在计算dft时，类似于fft位数为2的n次方时计算效率会提升，所以需要先计算优化后的长和宽

```
int row = getOptimalDFTSize(image.rows);
int col = getOptimalDFTSize(image.cols);
```
然后将原图像image拷贝到被操作的image2中并在周围进行补零操作

```
copyMakeBorder(image,image2,0,row-image.rows,0,col-image.cols,BORDER_CONSTANT, Scalar::all(0));
```
因为傅立叶变换后产生的结果为一个复数，所以我们需要两个跟image2等大的Mat来保存结果的实部和虚部

```
Mat planes[] = {Mat_<float>(image2), Mat::zeros(image2.size(), CV_32F)};
Mat complexI;
merge(planes,2, complexI);		//将两个单通道Mat合并成一个双通道Mat
```
进行傅立叶变换，这里输入和输出Mat为同一个

```
dft(complexI,complexI);
```
计算相位(phase)和振幅(magnitude)
$$
M = \sqrt{Re^2 + Im^2}  	\\ P = \arctan{\frac{Im}{Re}}
$$

```
//将计算好的数据分到planes中  planes[0] = Re planes[1] = Im
split(complexI,planes);
//计算mag 并复制给planes
magnitude(planes[0],planes[1],planes[0]);
Mat magI = planes[0];
```
我们取对数来更好的展示
$$
M = \log{(1 + M)}
$$

```
magI += Scalar::all(1);
log(magI,magI);
```
如果频谱图像的行数和列数为奇数，我们需要截取

```
magI = magI(Rect(0,0,magI.cols & -2,magI.rows & -2);
```
因为在1维的傅立叶变换后，在0-n/2之间的频谱才有意义，而n/2-n之间的频谱图像与0-n/2之间的频谱翻转过来的图像一样，为了便于观察，我们通常将n/2-n之间的频谱平移到-n/2-0之间,同理二维的傅立叶变换也可以进行类似的图像重新排列

```
int cx = magI.cols/2;
int cy = magI.rows/2;
Mat q0(magI,Rect(0,0,cx,cy));		//左上
Mat q1(magI,Rect(cx,0,cx,cy));		//右上
Mat q2(magI,Rect(0,cy,cx,cy));		//左下
Mat q3(magI,Rect(cx,cy,cx,cy));		//右下


//将左上和右下交换    右上和左下交换
Mat tmp;
q0.copyTo(tmp);
q3.copyTo(q0);
tmp.copyTo(q3);

q1.copyTo(tmp);
q2.copyTo(q1);
tmp.copyTo(q2);
```
最后因为计算出的数据并不是在图像显示的0-255之间，所以我们需要将数据转化一下

```
normalize(magI, magI, 0, 1, CV_MINMAX);
magI.convertTo(magI, CV_8UC1, 255);
imshow(magI);
```

