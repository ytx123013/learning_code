//
//  DispatchQueueManager.m
//  Concurrency
//
//  Created by aa on 16/11/25.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "DispatchQueueManager.h"

@implementation DispatchQueueManager

+ (instancetype)sharedManager
{
    static DispatchQueueManager *__sharedManager__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedManager__ = [[DispatchQueueManager alloc] init];
    });
    return __sharedManager__;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.concurrencyQueue = dispatch_queue_create("concurrencyQueue1", DISPATCH_QUEUE_CONCURRENT);
        self.serialQueue = dispatch_queue_create("serialQueue1", DISPATCH_QUEUE_SERIAL);
        
    }
    return self;
}

- (void)simpleConcurrencyTest
{
    for (int i = 0; i < 10; i++) {
        dispatch_async(self.concurrencyQueue, ^{
            int a = arc4random() % 10;
            NSLog(@"concurrency %d sleep",a);
            sleep(a);
            NSLog(@"concurrency %d awake",a);
        });
    }
    
}

- (void)simpleSerialTest
{
    dispatch_async(self.concurrencyQueue, ^{
        for (int i = 0; i < 10; i++) {
            dispatch_sync(self.serialQueue, ^{
                int a = arc4random() % 10;
                NSLog(@"serial %d sleep",a);
                sleep(a);
                NSLog(@"serial %d awake",a);
            });
        }
    });
}

- (void)iterationTest
{
    dispatch_apply(10, self.concurrencyQueue, ^(size_t i) {
        printf("%u\n",i);
    });
}

- (void)gcdSuspend
{
    dispatch_suspend(self.concurrencyQueue);
    NSLog(@"gcd suspend");
}

- (void)gcdResumed
{
    dispatch_resume(self.concurrencyQueue);
    NSLog(@"gcd resume");
}

- (void)gcdGroupWait
{
    dispatch_group_t group = dispatch_group_create();
    
    NSLog(@"group wait start");
    
    dispatch_group_async(group, self.concurrencyQueue, ^{
        int a = arc4random() % 10;
        NSLog(@"concurrency %d sleep",a);
        sleep(a);
        NSLog(@"concurrency %d awake",a);
       
    });
    
    dispatch_group_async(group, self.concurrencyQueue, ^{
        int a = arc4random() % 10;
        NSLog(@"concurrency %d sleep",a);
        sleep(a);
        NSLog(@"concurrency %d awake",a);
    });
    
    dispatch_group_async(group, self.concurrencyQueue, ^{
        int a = arc4random() % 10;
        NSLog(@"concurrency %d sleep",a);
        sleep(a);
        NSLog(@"concurrency %d awake",a);
    });
    
    dispatch_group_async(group, self.concurrencyQueue, ^{
        int a = arc4random() % 10;
        NSLog(@"concurrency %d sleep",a);
        sleep(a);
        NSLog(@"concurrency %d awake",a);
    });
    
    
//    dispatch_group_wait(group, DISPATCH_TIME_NOW);
    //等队列中全部任务任务结束后打印
    dispatch_group_notify(group, self.concurrencyQueue, ^{
        NSLog(@"group wait end");
    });
    
}

- (void)gcdSemaphoreLock
{
    __block int i = 0;
    
    
    //可以保证共享资源的同步
    //创建一个信号量为1，表示可用该信号量的线程数为1
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_async(self.concurrencyQueue, ^{
        
        //等待信号量不为0的时候可以继续进行并将信号量－1
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"task 1 operation;");
        //操作数据
        NSLog(@"i = %d",i);
        sleep(1);
        i = 1;
        
        //释放信号量，即信号量+1
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(self.concurrencyQueue, ^{
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"task 2 operation;");
        NSLog(@"i = %d",i);
        sleep(2);
        i = 2;
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(self.concurrencyQueue, ^{
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"task 3 operation;");
        NSLog(@"i = %d",i);
        sleep(3);
        i = 3;
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(self.concurrencyQueue, ^{
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"task 4 operation;");
        NSLog(@"i = %d",i);
        sleep(4);
        i = 4;
        dispatch_semaphore_signal(semaphore);
    });
    
}

@end
