//
//  ViewController.m
//  BlockTest
//
//  Created by aa on 16/11/11.
//  Copyright © 2016年 ytx. All rights reserved.
//

#import "ViewController.h"
#import "BasicBlock.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *view1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self basicBlockOperations];
    
    
    int a = 9;
    UIView *view2;
    UIView *view = [[UIView alloc] init];
    self.view1 = [[UIView alloc] init];
    NSLog(@"%p %p %p %p",&a,view,self.view1,view2);
    
}

- (void)basicBlockOperations
{
    BasicBlock *basic = [[BasicBlock alloc] init];
    [basic basicBlockOperation];
    [basic blockVariables];
    [basic typedefBlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
