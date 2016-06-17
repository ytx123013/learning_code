##内省
在变量前面或后面加上问号? 可以打印该对象的有关通用信息  
使用?? 会显示出对应函数的源码
##%run
使用%run可以运行一个python脚本  
eg.%run script_test.py  
这样就可以访问脚本中的变量和函数
##%debug
在执行代码错误后执行 %debug 会直接跳转到引发异常的栈帧
##%time %timeit
%time 一次执行一条语句，然后打印总体执行时间  
应关注wall time  
%timeit 对于执行的语句，会自动执行多次并计算平均值打印出来
##%bookmark
%bookmark aa bbb  
用aa来表示bbb 类似于宏
##%cpaste
可以整段复制粘贴
##%prun
可以测试函数性能
##重新加载依赖项
当执行import xxx时，xxx中代码会被执行，并且其中所有变量、函数和引用项都会被保存在一个新建的xxx模块命名空间中，当下次再执行import xxx时会得到xxx模块的一个引用，而并非是一个新建立的模块。  
所以当import xxx后修改了xxx.py中的代码，其本质上引用的还是原来修改前的代码，所以在import xxx后面添加一句dreload(xxx)来更新模块内代码，如果实在不行可以重新启动ipython

