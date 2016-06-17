<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
#4个基本子空间
现以A为mxn的矩阵为例，其经过消元后得到最简形式的矩阵R
##列空间
记作C(A) 在空间\\(R^{m}\\)中  
空间维数为A的秩rA  
一个标准基是A的主列
##零空间
使等式Ax = 0成立的x所组成的空间，记作N(A) 在空间\\(R^{n}\\)中  
n-rA为自由变量的个数，也就是形成了一组n-rA个特解的向量组为一个标准基  
空间维数是 n-rA 维
##行空间
一般我们都采用列空间处理问题，所以可以记为\\(C(A^{T})\\)  在空间\\(R^{n}\\)中  
空间维数为A的秩rA  转置后秩不变
一个标准基是矩阵R的前rA行
##转置后的零空间
记作\\(N(A^{T})\\)，也称作A的左零空间  在空间\\(R^{m}\\)中  
维数为 m-rA
##Tips
矩阵A与矩阵R的行空间是一样的，而列空间则发生了改变  
dim C(A) = dim C(\\(A^{T}\\)),同一个矩阵行空间和列空间的秩是一样的