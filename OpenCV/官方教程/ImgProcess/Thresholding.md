# 域值转换
使用threshold将图像域值转换。
### threshold binary
即二值处理，将大于某个域值设为最大值，小于的则设为0
$$
dst(x,y) = 
\begin{equation}
\begin{cases}
maxVal\ \ \ \ if\ src(x,y)>thresh \\\\
0\ \ \ \ others
\end{cases}
\end{equation}
$$

### threshold binary inverted
与上面相反
$$
dst(x,y) = 
\begin{equation}
\begin{cases}
0\ \ \ \ if\ src(x,y)>thresh \\\\
maxVal\ \ \ \ others
\end{cases}
\end{equation}
$$

### Truncate
截断，将大于某个域值的所有数据都设为一个值
$$
dst(x,y) = 
\begin{equation}
\begin{cases}
thresh\ \ \ \ if\ src(x,y)>thresh \\\\
src(x,y)\ \ \ \ others
\end{cases}
\end{equation}
$$

### Threshold to Zero
将小于一个值的全部设为0，剩下的保持原状
$$
dst(x,y) = 
\begin{equation}
\begin{cases}
src(x,y)\ \ \ \ if\ src(x,y)>thresh \\\\
0\ \ \ \ others
\end{cases}
\end{equation}
$$

### Threshold to Zero,Inverted
上面的倒过来，将大于的设为0
$$
dst(x,y) = 
\begin{equation}
\begin{cases}
0\ \ \ \ if\ src(x,y)>thresh \\\\
src(x,y)\ \ \ \ others
\end{cases}
\end{equation}
$$


