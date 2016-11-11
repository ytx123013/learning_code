//
//  CVImageConvert.h
//  OpenCV
//
//  Created by aa on 16/9/27.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CVImageConvert : NSObject

+ (cv::Mat)cvRGBMatFromUIImage:(UIImage *)image;
+ (cv::Mat)cvRGBAMatFromUIImage:(UIImage *)image;
+ (cv::Mat)cvGrayMatFromUIImage:(UIImage *)image;

//无alpha通道
+ (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;


+ (UIImage *)UIGrayImageFromUIImage:(UIImage *)image;

@end
