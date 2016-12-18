# Tpyes of dispatch queues
* Serial
* Concurrent
* Main

# Dispatch Queue需要注意几点
* 任何的Queue是不相干的，任务的顺序只会发生在一个队列中。
* 任何加入队列的任务都要是已经准备就绪的。
* 用dispatch_queue_create()函数创建队列，并注意该函数创造的队列需要内存管理，即用strong属性引用。创建多个同步队列可以并行执行，所以注意不要创建大量的同步队列。
* 异步队列也可以用dispatch_get_global_queue()函数获取。
* 不要在在一个队列里用dispatch_sync调用同一个队列，这样会引起死锁，如

```
dispatch_sync(self.serialQueue, ^{
		dispatch_sync(self.serialQueue, ^{
			NSLog(@"error 死锁");
		});
});
```
* 对于需要循环结构访问数据的时候可以用dispatch_apply()，它可以让循环结构内的代码同步进行，需要注意的是这样会造成多线程修改数据发生错误，所以最好是访问数据时使用。
* dispatch_suspend()、dispatch_resume()只能将队列挂起和恢复，已经执行了的block不能暂停。
* 若需要知道一个异步队列所有任务都完成的消息，可以用dispatch_group来实现.
* 在gcd异步队列中可以使用dispatch_semaphore来对共享资源进行加锁的操作


