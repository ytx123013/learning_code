<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
##线性方程组求解
方程组:
\begin{equation}
\begin{cases}
2x - y = 0\\\\
-x + 2y = 3\\\\
\end{cases}
\end{equation}
系数矩阵(row picture)如下:
$$
\begin{bmatrix}
2 & -1 \\\\
-1 & 2 \\\\
\end{bmatrix}
\begin{bmatrix}
x \\\\
y \\\\
\end{bmatrix}＝
\begin{bmatrix}
0 \\\\
3 \\\\
\end{bmatrix}
$$
列矩阵(column picture)如下:  
$$
x\begin{bmatrix}
2 \\\\
-1
\end{bmatrix}+
y\begin{bmatrix}
-1 \\\\
2
\end{bmatrix}=
\begin{bmatrix}
0 \\\\
3 \\\\
\end{bmatrix}
$$
也称为linear combination,即向量相加等于结果的向量
##矩阵消元
消元本身没东西可讲，但是引出了矩阵的结合律  
即对于矩阵A、B、C来说
$$
\begin{equation}
\(A\*B\)\*C = A \* \(B \* C \)
\end{equation}
$$
但是矩阵不适用于交换律

##矩阵相乘
若矩阵A与矩阵B相乘得到矩阵C  
$$
\begin{equation}
A\*B = C
\end{equation}
$$
则矩阵C的[i,j]处的值为A矩阵第i行与B矩阵第j列的值分别对应相乘后求和  
C中的任意一行都是由B中的每一行线性组合而成的。  
C中的任意一列都是由A中的每一列线型组合而成的。
##逆矩阵
$$
\begin{equation}
A^{-1}\*A = I = A \* A^{-1}
\end{equation}
$$
其中 I 为单位矩阵，对于方阵来说若存在逆矩阵，则左乘与右乘的结果都为单位矩阵 I  
现假设矩阵A、B均可逆，则
$$
\begin{equation}
\(A \* B \)\* \(B^{-1} \* A^{-1} \)= I
\end{equation}
$$
