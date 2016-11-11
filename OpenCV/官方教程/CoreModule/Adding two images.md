# 线性叠加
即将两个图像根据透明度叠加起来
$$
h(x) = (1 - \alpha)f(x) + \alpha g(x)
$$

```
beta = (1.0 - alpha);
addWeighted(img1,alpha,img2,beta,0.0,resImage);
```

