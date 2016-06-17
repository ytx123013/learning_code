##Iterators, generator 
###Iterators
iterators 遵循[iterator protocol](https://docs.python.org/dev/library/stdtypes.html#iterator-types),也就是说会有next方法获取下一个item。一个iterator只允许循环一次，他会保存当前的位置。  
__iter__()可以创建一个新的iterators。  
file 也是一个iterator，但是__iter__()不会创建一个新的iterator，只允许单线程访问。

###Generator expressions
另一个生成iterator对象的方法是通过Generator Expressions。  
Generator expression是由()包围着的。  
由[]包围着的会产生一个list。  
由{}包围着的会产生一个set。  
由{}包围着并有键值对形式的会产生一个dict。

###Generators
第三种产生iterator对象的是调用generator函数。  

##Decorators
###

##Set
set.union() 返回set的并集