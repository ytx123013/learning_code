# Usage
Blocks represent typically small, self-contained pieces of code. As such, they’re particularly useful as a means of encapsulating units of work that may be executed concurrently, or over items in a collection, or as a callback when another operation has finished.

Blocks are a useful alternative to traditional callback functions for two main reasons:

1. They allow you to write code at the point of invocation that is executed later in the context of the method implementation.
Blocks are thus often parameters of framework methods.

2. They allow access to local variables.
Rather than using callbacks requiring a data structure that embodies all the contextual information you need to perform an operation, you simply access local variables directly.

# 关于变量
block对外部变量的管理

####	局部变量
在block中使用栈内存中的变量，会将其当作const变量，变量值为进入block时变量的值。

#### static、全局变量
因为全局变量或静态变量在内存中地址是固定的，所以block在读取该变量时直接从其所在的内存中读取出来

#### block变量
block修饰的变量在定义使用该变量的block时会被转移到堆内存上

# 内存管理
 If you use a block within the implementation of a method:

* If you access an instance variable by reference, a strong reference is made to self;
* If you access an instance variable by value, a strong reference is made to the variable.


```
dispatch_async(queue, ^{
    // instanceVariable is used by reference, a strong reference is made to self
    doSomethingWithObject(instanceVariable);
});
 
 
id localVariable = instanceVariable;
dispatch_async(queue, ^{
    /*
      localVariable is used by value, a strong reference is made to localVariable
      (and not to self).
    */
    doSomethingWithObject(localVariable);
});
```


