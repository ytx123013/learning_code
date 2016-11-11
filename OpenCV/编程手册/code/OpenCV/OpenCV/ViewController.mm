//
//  ViewController.m
//  OpenCV
//
//  Created by aa on 16/9/24.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "ViewController.h"
#include "CVFiles/CVLoad.hpp"
#import "CVImageConvert.h"
#include "CVImageMake.hpp"
#include "CVImageColorOperations.hpp"
#include "CVColorDetector.hpp"
#include "CVHistogram.hpp"
#include "CVThresholding.hpp"
#include "CVMorphologyOperations.hpp"

@interface ViewController ()

@property (nonatomic,strong) UIImage            *oriImage;
@property (nonatomic,strong) NSString           *oriImagePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.oriImage = [UIImage imageNamed:@"bbb.jpg"];
    self.oriImagePath = [[NSBundle mainBundle] pathForResource:@"bbb" ofType:@"jpg"];
    NSLog(@"%@",self.oriImagePath);
    self.img1.image = self.oriImage;
//    cv::Mat image = [CVImageConvert cvMatFromUIImage:self.oriImage];
//    std::cout << image << std::endl;
//    [self grayOperation];
//    [self noiseMake];
//    [self colorReduce];
//    [self colorSharpen];
//    [self colorDetector];
//    [self hist1D];
//    [self histRGB];
//    [self grayReverse];
//    [self equalize];
//    [self threshold];
//    [self open];
//    [self gradient];
    [self topHat];
}

//灰度图操作
- (void)grayOperation
{
    cv::Mat grayMat = [CVImageConvert cvGrayMatFromUIImage:self.oriImage];
    UIImage *grayImage = [CVImageConvert UIImageFromCVMat:grayMat];
    self.img2.image = grayImage;
    
    
}

/*//噪点产生
- (void)noiseMake
{
    cv::Mat image = [CVImageConvert cvMatFromUIImage:self.oriImage];
    createSaltNoise(image, 1000);
    self.img2.image = [CVImageConvert UIImageFromCVMat:image];
}

//颜色缩减
- (void)colorReduce
{
    cv::Mat image = [CVImageConvert cvMatFromUIImage:self.oriImage];
    colorReduce(image);
    self.img2.image = [CVImageConvert UIImageFromCVMat:image];
}

//锐化
- (void)colorSharpen
{
    cv::Mat image = [CVImageConvert cvMatFromUIImage:self.oriImage];
    cv::Mat result(image.rows,image.cols,CV_8UC4);
    colorSharpen(image,result);
    self.img2.image = [CVImageConvert UIImageFromCVMat:result];
}


//检测颜色
- (void)colorDetector
{
    ColorDetector detector;
    cv::Mat image = [CVImageConvert cvMatFromUIImage:self.oriImage];
    detector.setTargetColor(48, 87, 209);
    std::cout << detector.getTargetColor() << std::endl;
    cv::Mat result = detector.process(image);
    self.img2.image = [CVImageConvert UIImageFromCVMat:result];
}*/

//灰度直方图
- (void)hist1D
{
//    UIImage *grayImage = [CVImageConvert CVGrayUIImageFromUIImage:self.oriImage];
    cv::Mat grayImage = [CVImageConvert cvGrayMatFromUIImage:self.oriImage];
//    cv::Mat grayMat = [CVImageConvert cvMatFromUIImage:grayImage];
    Histogram1D h;
    
    cv::Mat hist = h.getHistogramImage(grayImage);
    self.img2.image = [CVImageConvert UIImageFromCVMat:grayImage];
    self.img3.image = [CVImageConvert UIImageFromCVMat:hist];
    
    
}

- (void)histRGB
{
    cv::Mat rgbImage = [CVImageConvert cvRGBMatFromUIImage:self.oriImage];
    HistogramRGB h;
    cv::Mat hist = h.getHistogram(rgbImage);
}

//灰度值强度翻转
- (void)grayReverse
{
    cv::Mat grayImage = [CVImageConvert cvGrayMatFromUIImage:self.oriImage];
    cv::Mat result;
    grayReverse(grayImage,result);
    self.img2.image = [CVImageConvert UIImageFromCVMat:grayImage];
    self.img3.image = [CVImageConvert UIImageFromCVMat:result];
}

//直方图均衡化
- (void)equalize
{
    cv::Mat grayImage = [CVImageConvert cvGrayMatFromUIImage:self.oriImage];
    cv::Mat result;
//    applyEqualize(grayReverse, result);
    applyEqualize(grayImage, result);
    self.img2.image = [CVImageConvert UIImageFromCVMat:grayImage];
    self.img3.image = [CVImageConvert UIImageFromCVMat:result];
    
}

- (void)threshold
{
    cv::Mat grayImage = [CVImageConvert cvGrayMatFromUIImage:self.oriImage];
    cv::Mat result;
    applyThresholdBinary(grayImage, result, 156, 255);
    self.img2.image = [CVImageConvert UIImageFromCVMat:grayImage];
    self.img3.image = [CVImageConvert UIImageFromCVMat:result];
}


//开操作
- (void)open
{
    cv::Mat image = [CVImageConvert cvRGBMatFromUIImage:self.oriImage];
    cv::Mat result;
    Mat element = getStructuringElement(MORPH_ELLIPSE, cv::Size(3,3));
    applyOpenOperation(image, result, element);
    self.img2.image = [CVImageConvert UIImageFromCVMat:result];
    applyCloseOperation(result, result, element);
    self.img3.image = [CVImageConvert UIImageFromCVMat:result];
}


//形态学梯度
- (void)gradient
{
    cv::Mat image = [CVImageConvert cvGrayMatFromUIImage:self.oriImage];
    cv::Mat result;
    Mat element = getStructuringElement(MORPH_ELLIPSE, cv::Size(4,4));
    applyGradientOperation(image, result, element);
    self.img2.image = [CVImageConvert UIImageFromCVMat:image];
    self.img3.image = [CVImageConvert UIImageFromCVMat:result];
}

//顶帽
- (void)topHat
{
    cv::Mat image = [CVImageConvert cvGrayMatFromUIImage:self.oriImage];
    cv::Mat result;
    Mat element = getStructuringElement(MORPH_ELLIPSE, cv::Size(40,40));
    applyTopHatOperation(image, result, element);
    self.img2.image = [CVImageConvert UIImageFromCVMat:image];
    self.img3.image = [CVImageConvert UIImageFromCVMat:result];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
