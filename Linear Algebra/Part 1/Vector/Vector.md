<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
##向量空间(Vector Space)
\\(R^{n}\\)代表n维向量
***
列空间  
将一个矩阵的列放到一个空间里，这个空间叫做列空间
##矩阵的秩 rank
即限制的主元的条件个数，也就是说当矩阵消元后剩下的非零行数。
##Ax = 0
齐次方程组指的是等号右边均为0的方程组。
##Ax = b 
将等号右边的矩阵b添加到系数矩阵A右边后所构成的矩阵叫做增广矩阵，即
$$
\begin{bmatrix}
A & b
\end{bmatrix}
$$
##主列与自由列
若矩阵A消元后得到矩阵
$$
\begin{bmatrix}
1 & 0 & 1 & 1 \\\\ 
0 & 1 & 1 & 0 \\\\ 
0 & 0 & 0 & 0 \\\\
\end{bmatrix}
$$
则主列为前两列，自由列为后两列。  
求Ax = 0,则向量x对应的x1、x2为主元，x3、x4为自由变量。
##特解(Special Solutions)
当进行消元操作后，未知数个数m大于方程组的个数n，要使得方程组有解，则需要(m-n)个自由变量。  
自由变量就是给定几个随机的值来求得剩下未知数的值，这样的一组解叫做特解。  
一般将自由变量逐个赋值为1，其余为0，得出一组特解

