<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
##矩阵置换(Permutations)  
置换矩阵，是行重新排列了的单位矩阵 记作矩阵P  
在一个n阶矩阵中，行重新排列顺序后共有 n! 种情况，也就是说 P 共有 n! 种情况  
矩阵 P 均可逆，且其逆矩阵与其转置后的矩阵相同，即
$$
P^{-1}=p^{T} \\\\
p^{T} \* P = I
$$
若行置换，则将矩阵放在原矩阵左边，列置换放在原矩阵右边  
行置换，即
$$
\begin{bmatrix}
a & b \\\\
c & d \\\\
\end{bmatrix}->
\begin{bmatrix}
c & d \\\\
a & b \\\\
\end{bmatrix}
$$
$$
\begin{bmatrix}
0 & 1 \\\\
1 & 0 \\\\
\end{bmatrix}\*
\begin{bmatrix}
a & b \\\\
c & d \\\\
\end{bmatrix}->
\begin{bmatrix}
c & d \\\\
a & b \\\\
\end{bmatrix}
$$
列置换，即
$$
\begin{bmatrix}
a & b \\\\
c & d \\\\
\end{bmatrix}->
\begin{bmatrix}
b & a \\\\
d & c \\\\
\end{bmatrix}
$$
$$
\begin{bmatrix}
a & b \\\\
c & d \\\\
\end{bmatrix}\*
\begin{bmatrix}
0 & 1 \\\\
1 & 0 \\\\
\end{bmatrix}->
\begin{bmatrix}
b & a \\\\
d & c \\\\
\end{bmatrix}
$$
##矩阵转置(Transposes)
即行和列互换
$$
\(A^{T})\_{ij} = A\_{ji}
$$
***
对称矩阵(symmetric matrices)  
即转置后仍和原矩阵一样
$$
A^{T} = A
$$
将一个矩阵与其转置的矩阵相乘可得到一个对称矩阵