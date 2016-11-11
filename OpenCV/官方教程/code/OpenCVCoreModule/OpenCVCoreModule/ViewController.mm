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

@property (nonatomic,strong) UIImage                *oriImage;
@property (nonatomic,strong) CVObjecCConvert        *convert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.oriImage = [UIImage imageNamed:@"333.jpg"];
    self.img1.image = self.oriImage;
    
    self.convert = [[CVObjecCConvert alloc] init];
    self.convert.oriImage = self.oriImage;
    self.convert.oriImage2 = [UIImage imageNamed:@"aaa.jpg"];
    
    
    //临域操作
//    [self maskOperation];
    
    //两张照片叠加操作
//    [self addImageOperation];
    
    //更改对比度 亮度
//    [self changeBri];
    
    //傅立叶变换
//    [self dft];
    
    //模糊操作
//    [self blur];
//    [self gaussianBlur];
//    [self medianBlur];
    
    //升降采样操作
//    [self upSample];
//    [self downSample];
    

    //sobel检测
//    [self sobelDetect];
//    [self lapulaceDetect];
//    [self cannyDetect];
    
    //remapping
    [self LRReverse];
//    [self UDReverse];
    [self LRUDReverse];
    
}

- (void)maskOperation
{
    
    self.img2.image = [self.convert maskOperation];
}

- (void)addImageOperation
{
    self.img2.image = [self.convert getLinearBlendingImage];
}
     
- (void)changeBri
{
    self.img2.image = [self.convert getImageWithContrast:0.5 brigtness:30];
    self.img3.image = [self.convert getImageWithContrast:1.5 brigtness:10];
}

- (void)dft
{
    self.img2.image = [self.convert getImageDFTMagImage];
}

- (void)blur
{
    self.img2.image = [self.convert getBlurImage];
}

- (void)gaussianBlur
{
    self.img2.image = [self.convert getGaussianBlurImage];
}

- (void)medianBlur
{
    self.img2.image = [self.convert getMedianBlurImage];
}

- (void)upSample
{
    self.img2.image = [self.convert getPyrUpImage];
}

- (void)downSample
{
    self.img3.image = [self.convert getPyrDownImage];
}

- (void)sobelDetect
{
    self.img2.image = [self.convert getSobelImage];
}

- (void)lapulaceDetect
{
    self.img3.image = [self.convert getLapulaceImage];
}

- (void)cannyDetect
{
    self.img3.image = [self.convert getCannyImage];
}

- (void)LRReverse
{
    self.img2.image = [self.convert getRLReverseImage];
}

- (void)UDReverse
{
    self.img3.image = [self.convert getUDReverseImage];
}

- (void)LRUDReverse
{
    self.img3.image = [self.convert getLRUDReverseImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
