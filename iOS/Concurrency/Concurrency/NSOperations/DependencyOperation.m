//
//  DependencyOperation.m
//  Concurrency
//
//  Created by aa on 16/11/17.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "DependencyOperation.h"

@implementation DependencyOperation

- (void)printOperation
{
    sleep(3);
    NSLog(@"Operation %@ work",self.name);
    sleep(2);
}

@end
