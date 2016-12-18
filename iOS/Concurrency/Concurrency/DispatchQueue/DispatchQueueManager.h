//
//  DispatchQueueManager.h
//  Concurrency
//
//  Created by aa on 16/11/25.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DispatchQueueManager : NSObject

@property (nonatomic,strong) dispatch_queue_t concurrencyQueue;
@property (nonatomic,strong) dispatch_queue_t serialQueue;

+ (instancetype)sharedManager;

- (void)simpleConcurrencyTest;

- (void)simpleSerialTest;

- (void)iterationTest;

- (void)gcdSuspend;

- (void)gcdResumed;

- (void)gcdGroupWait;

- (void)gcdSemaphoreLock;

@end
