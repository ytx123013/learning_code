//
//  OperationManager.m
//  Concurrency
//
//  Created by aa on 16/11/17.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "OperationManager.h"

@implementation OperationManager

+ (instancetype)sharedManager
{
    static OperationManager *__sharedManager__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedManager__ = [[OperationManager alloc] init];
    });
    return __sharedManager__;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.basicConcurrencyQueue = [[NSOperationQueue alloc] init];
        self.dependencyQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

#pragma mark - basic operation
- (void)testBasicConcurrencyQueue
{
    for (int i = 0; i < 5; i++) {
        BasicOperation *operation = [[BasicOperation alloc] initWithName:[NSString stringWithFormat:@"%d",i]];
        [self.basicConcurrencyQueue addOperation:operation];
    }
}

- (void)printBasicConcurrencyQueueInfo
{
    [self printQueueInfo:self.basicConcurrencyQueue];
}

- (void)cancelBasicConcurrencyQueue
{
    [self.basicConcurrencyQueue cancelAllOperations];

}

#pragma mark - dependency operation
- (void)testDenpendencyQueue
{
    DependencyOperation *operation1 = [[DependencyOperation alloc] initWithName:@"1"];
    DependencyOperation *operation2 = [[DependencyOperation alloc] initWithName:@"2"];
    DependencyOperation *operation3 = [[DependencyOperation alloc] initWithName:@"3"];
    DependencyOperation *operation4 = [[DependencyOperation alloc] initWithName:@"4"];
    
    [operation2 addDependency:operation1];
    [operation1 addDependency:operation4];
    
    
    [self.dependencyQueue addOperation:operation1];
    [self.dependencyQueue addOperation:operation2];
    [self.dependencyQueue addOperation:operation3];
    [self.dependencyQueue addOperation:operation4];

    
    ReadyDependencyOperation *operation5 = [[ReadyDependencyOperation alloc] initWithName:@"5"];
    [self.dependencyQueue addOperation:operation5];
    sleep(4);
    self.dependencyQueue.suspended = YES;
    sleep(6);
    self.dependencyQueue.suspended = NO;
    [operation5 readyToOperate];
}

- (void)printDenpendencyConcurrencyQueueInfo
{
    [self printQueueInfo:self.dependencyQueue];
}

- (void)printQueueInfo:(NSOperationQueue *)operationQueue
{
    NSLog(@"线程数量: %lu",(unsigned long)operationQueue.operationCount);
    NSMutableString *operationNames = [[NSMutableString alloc] init];
    for (NSOperation *operation in operationQueue.operations) {
        [operationNames appendString:[NSString stringWithFormat:@"%@, ",operation.name]];
    }
    NSLog(@"线程名称: %@",operationNames);
}

@end
