<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
以所有 3x3 矩阵所构成的空间M为例
##矩阵空间
可以看作是新的向量空间
##标准基
以空间M为例，其一组基为
$$
\begin{bmatrix}
1 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 1 & 0 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 1 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 0 \\\\ 
1 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
...
\begin{bmatrix}
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 1 \\\\
\end{bmatrix}
$$
共有9个矩阵，所以空间M的维度dim(M)=9
##对称矩阵(Symmetrial)
假设空间M的对成矩阵子空间为S，其标准基为
$$
\begin{bmatrix}
1 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 0 \\\\ 
0 & 1 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 1 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 1 & 0 \\\\ 
1 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 1 \\\\ 
0 & 0 & 0 \\\\ 
1 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 0 \\\\ 
0 & 0 & 1 \\\\ 
0 & 1 & 0 \\\\
\end{bmatrix}
$$
共6个矩阵，所以空间S维度dim(S)=6
##上三角矩阵(Upper Triangular)
假设空间M中所有上三角矩阵构成的上三角矩阵空间为U，其标准基为
$$
\begin{bmatrix}
1 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 0 \\\\ 
0 & 1 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 1 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 1 & 0 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 1 \\\\ 
0 & 0 & 0 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
\begin{bmatrix}
0 & 0 & 0 \\\\ 
0 & 0 & 1 \\\\ 
0 & 0 & 0 \\\\
\end{bmatrix}
$$
共6个，矩阵所依空间U的维度dim(U)=6
##对角矩阵(Diagonal)
即除主对角线之外的元素都为0点矩阵，对角线上元素可以为0.  
假设空间M中所有对角矩阵构成的空间为D  
则D = S \\(\cap\\) U  
其维度dim(D)=3
##Tips
当我们将S中任意一个矩阵加上U中任意一个矩阵所构成的集合记作S+U  
S+U 可以得到全部的 3x3的矩阵  
即S+U构成了空间M  
dim(S+U)=9  
dim(S)+dim(U)=dim(S+U)+dim(S\\(\cap\\)U)
##秩1矩阵
即秩为1的矩阵，可以搭建出任意一个矩阵  
秩为4的矩阵，可以分解成4个秩1矩阵。  
秩1矩阵可以分解成一个列向量乘以一个行向量的形式。
eg.
$$
\begin{bmatrix}
1 & 5 & 10 \\\\ 
2 & 10 & 20 \\\\ 
3 & 15 & 30 \\\\
\end{bmatrix}
$$
可以分解成
$$
\begin{bmatrix}
1 \\\\ 
2 \\\\ 
3 \\\\
\end{bmatrix}＊
\begin{bmatrix}
1 & 5 & 10 \\\\ 
\end{bmatrix}
$$
且行向量和列向量为行空间和列空间的基