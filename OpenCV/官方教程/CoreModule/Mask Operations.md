# 遮罩  
也就是临域操作，根据当前位置和周围的像素值进行处理

使用filter2d定义一个kernel可以对图像中每个像素根据临域进行操作，如使像素值等于 5*cur-top-bottom-left-right

```
Mat kernel = (Mat_<char>(3,3) << 0, -1, 0,
                                -1, 5, -1,
                                 0, -1, 0);
filter2D(image, result, image.depth(), kernel);
```


