//
//  BasicBlock.m
//  BlockTest
//
//  Created by aa on 16/11/11.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "BasicBlock.h"


@implementation BasicBlock

- (void)basicBlockOperation
{
    int (^basciBlock)(int);
    basciBlock = ^(int number){
        return number + 1;
    };
    
    int a = 4;
    int b = basciBlock(a);
    NSLog(@"basic %d",b);
}

- (void)blockVariables
{
    __block int a = 0;
    void (^basciBlock)(int) = ^(int number){
        a++;
        NSLog(@"variable %d",a);
    };
    basciBlock(a);
}

- (void)typedefBlock
{
    AddOperation addOperation = ^(int first,int second){
        return first + second;
    };
    
    int first = 1;
    int second = 2;
    NSLog(@"add operation %d",addOperation(first,second)) ;
}

@end
