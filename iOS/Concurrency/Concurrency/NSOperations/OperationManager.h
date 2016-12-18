//
//  OperationManager.h
//  Concurrency
//
//  Created by aa on 16/11/17.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicOperation.h"
#import "DependencyOperation.h"
#import "ReadyDependencyOperation.h"

@interface OperationManager : NSObject

@property (nonatomic,strong) NSOperationQueue   *basicConcurrencyQueue;
@property (nonatomic,strong) NSOperationQueue   *dependencyQueue;

+ (instancetype)sharedManager;

- (void)testBasicConcurrencyQueue;
- (void)cancelBasicConcurrencyQueue;
- (void)printBasicConcurrencyQueueInfo;


- (void)testDenpendencyQueue;
- (void)printDenpendencyConcurrencyQueueInfo;

@end
