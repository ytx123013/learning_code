# Operations Class
1. NSInvocationOperation 
2. NSBlockOperation
3. NSOperation

# NSInvocationOperation

# NSOperation
* 复写start方法下记得在任务结束后调用相关任务结束的方法。
* 在循环任务中记得要检查cancel属性来判断是否从外部结束了该进程。并且在调用cancel方法时记得对线程中未进行完毕的任务进行处理。注意的是调用sleep()休眠时不会接受到cancel的请求。
* 没有将线程暂时挂起，再手动调用继续执行线程的方法。
* 可以手动复写Operation的isReady方法来自行控制何时线程可以启动。
* OperationQueue 的setSuspended:只能挂起队列，使新的线程不再执行，但已经正在执行的线程则无法停止。


