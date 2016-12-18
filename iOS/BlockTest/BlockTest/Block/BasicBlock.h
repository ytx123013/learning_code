//
//  BasicBlock.h
//  BlockTest
//
//  Created by aa on 16/11/11.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int (^AddOperation)(int,int);

@interface BasicBlock : NSObject

- (void)basicBlockOperation;

- (void)blockVariables;

- (void)typedefBlock;

@end
