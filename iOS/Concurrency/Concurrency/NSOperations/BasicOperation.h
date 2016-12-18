//
//  BasicOperation.h
//  Concurrency
//
//  Created by aa on 16/11/17.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicOperation : NSOperation

- (instancetype)initWithName:(NSString *)operationName;

- (void)printOperation;

@end
