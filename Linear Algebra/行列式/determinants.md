<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
##行列式 (Determinants)
方阵A的行列式记作 detA 或者 \\(|A|\\)  
##行列式特征
1.  \\(det\ I = 1\\)
2.  交换矩阵的行，行列式的值的符号会相反
3.  当任何一个数t乘以一行，而不改变其他行，行列式结果等于t乘以原先的行列式
$$
\begin{vmatrix}
ta & tb \\\\
c & d \\\\
\end{vmatrix}=t
\begin{vmatrix}
a & b \\\\
c & d \\\\
\end{vmatrix}
$$
4.  只改变一行数据,而不改变其他行
$$
\begin{vmatrix}
a+a\_{1} & b+b\_{1} \\\\
c & d \\\\
\end{vmatrix}=
\begin{vmatrix}
a & b \\\\
c & d \\\\
\end{vmatrix}+
\begin{vmatrix}
a\_{1} & b\_{1} \\\\
c & d \\\\
\end{vmatrix}
$$
5.  若矩阵中两行相等，则行列式等于0
6.  矩阵做消元操作，但不会改变行列式的值
7.  若矩阵有一行是0，则行列式为0
8.  若矩阵为上三角矩阵，矩阵的行列式为对角线各个元素的值相乘
9.  若矩阵行列式为0，则A为奇异矩阵，即不可逆，当矩阵可逆时，其行列式不为0
10.  两个矩阵相乘后的行列式等于两个矩阵行列式的乘积
$$
(det\ AB) = (det\ A)(det\ B)
$$
可以推出
$$
(det\ A)(det\ A^{-1})=det\ I=1 \\\\
det\ 2A = 2^{n}det\ A
$$
11.  \\(det\ A^{T} = det\ A \\)

##行列式公式
##余子式
