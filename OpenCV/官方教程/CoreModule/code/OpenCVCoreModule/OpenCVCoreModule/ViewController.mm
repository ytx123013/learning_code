//
//  ViewController.m
//  OpenCVCoreModule
//
//  Created by aa on 16/10/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "ViewController.h"
#import "CVObjecCConvert.h"

@interface ViewController ()

@property (nonatomic,strong) UIImage        *oriImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.oriImage = [UIImage imageNamed:@"bbb.jpg"];
    self.img1.image = self.oriImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
