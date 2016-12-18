//
//  BasicOperation.m
//  Concurrency
//
//  Created by aa on 16/11/17.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "BasicOperation.h"
#include <math.h>

@interface BasicOperation (){
    BOOL        isExecuting;
    BOOL        isFinished;
}

@end

@implementation BasicOperation

- (instancetype)initWithName:(NSString *)operationName
{
    if (self = [super init]) {
        self.name = operationName;
    }
    return self;
}

#pragma mark - override
- (void)start
{
    if (![self isCancelled]) {
        [self operationStart];
    }else{
        return;
    }
    [self printOperation];
    [self operationFinished];
    
}

- (BOOL)isConcurrent
{
    return YES;
}

- (BOOL)isExecuting
{
    return isExecuting;
}

- (BOOL)isFinished
{
    return isFinished;
}

#pragma mark - func
- (void)operationFinished
{
    NSLog(@"Operation %@ finish",self.name);
    
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    isExecuting = NO;
    isFinished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (void)operationStart
{
    NSLog(@"Operation %@ start",self.name);
    
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    isExecuting = YES;
    isFinished = NO;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (void)printOperation
{
    while (![self isCancelled]) {
        NSLog(@"Operation %@ work",self.name);
    }
}

@end
