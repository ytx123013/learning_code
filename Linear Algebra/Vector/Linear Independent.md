<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
##线性相关
一般都说一个向量组是线性相关，而不是一个矩阵。  
若列向量V1、V2、V3..存在一组全部非零的一组值x1,x2,x3..，使得
$$
V\_{1} \* x\_{1} + V\_{2} \* x\_{2} + V\_{3} \* x\_{3} ... = 0(向量)
$$
则称列向量V1、V2、V3..线性相关。即向量组内任意个向量可以组成另一个向量同向的向量。  
任何三个二维空间里的向量都是线性相关的。
eg.令
$$
V\_{1} = \begin{bmatrix} 2 \\\\ 1 \end{bmatrix} 
V\_{2} = \begin{bmatrix} 1 \\\\ 2 \end{bmatrix} 
V\_{3} = \begin{bmatrix} 2.5 \\\\ -1 \end{bmatrix} 
X = \begin{bmatrix} x1 \\\\ x2 \\\\x3 \end{bmatrix} \\\\
A*X = 
\begin{bmatrix} 
2 & 1 & 2.5\\\\
1 & 2 & -1
\end{bmatrix} * 
\begin{bmatrix} x1 \\\\ x2 \\\\x3 \end{bmatrix}=
\begin{bmatrix} 0 \\\\ 0 \end{bmatrix} 
$$
若存在向量X使得上式成立，则说明V1、V2、V3向量组线性相关。
##线性无关
与线性相关对立，也称为 independent。  
##标准基(Standard Basis)
在一个向量空间中存在一组向量，通过线性组合可以表示这歌空间内的任意一个向量，则这组向量叫做基。  
eg.在三维空间\\(R^{3}\\)中一个基是
$$
\begin{bmatrix} 0 \\\\ 0 \\\\1 \end{bmatrix} 
\begin{bmatrix} 0 \\\\ 1 \\\\0 \end{bmatrix} 
\begin{bmatrix} 1 \\\\ 0 \\\\0 \end{bmatrix} \\\\
$$
\\(R^{n}\\)空间中需要n个向量构成基。  
当由n个列向量构成的矩阵可逆时，这个空间才是\\(R^{n}\\)空间，并且这n个列向量为该空间的基。  
空间的维数一般等于矩阵的秩rA。