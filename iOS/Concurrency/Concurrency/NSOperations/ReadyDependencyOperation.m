//
//  ReadyDependencyOperation.m
//  Concurrency
//
//  Created by aa on 16/11/18.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "ReadyDependencyOperation.h"

@interface ReadyDependencyOperation()
{
    BOOL                 isReady;
}

@end

@implementation ReadyDependencyOperation

- (void)readyToOperate
{
    [self willChangeValueForKey:@"isReady"];
    
    isReady = YES;
    
    [self didChangeValueForKey:@"isReady"];
}

- (BOOL)isReady
{
    return isReady;
}


@end
