# 求导
## 复合函数求导
对于复合函数$F(x) = f(g(x))$求导，可先领$t = g(x)$带入原函数中，先对$t$求导后，再乘以$t$对$x$求导的函数
eg.
$y = sin (x^2)$，可先领$t = x^2$，则原方程可等于$y = \sin t$，求导后得$y' = \cos t$，再对$t = x^2$求导，得$t' = 2x$，相乘再带入原方程中得
$$y' = (\cos t )*t'= (\cos x^2)*2x$$

## 初等函数求导表
* $(x^a)' = ax^{a -1}$
* $\sin 'x = \cos x, \cos 'x = -\sin x,\tan 'x = \sec ^2x,cot'\ x = -csc^2\ x$
* $(a^x)' = \ln a * a^x$
* $(\ln x)' = \frac{1}{x}$

## 初等函数的不定积分
* $\int x^a dx = \frac{1}{a+1}x^{a+1} + C$
* $\int 1 dx = x + C$
* $\int \cos x dx = \sin x + C$
* $\int \sin x dx = -\cos x + C$
* $\int a^x dx = \frac{1}{\ln a}a^x + C$
* $\int e^x dx = e^x + C$
* $\int \frac{1}{x}dx = \ln |x| + C$

