//
//  ViewController.h
//  GoogleTMS
//
//  Created by aa on 16/7/18.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *TopVIew;

@property (weak, nonatomic) IBOutlet UIStepper *zoom;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@end

