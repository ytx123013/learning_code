//
//  CVImageColorOperations.hpp
//  OpenCV
//
//  Created by aa on 16/10/9.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVImageColorOperations_hpp
#define CVImageColorOperations_hpp

#include <stdio.h>

using namespace cv;

//颜色缩减  即将某一范围相似的颜色设置成一个颜色
void colorReduce(Mat &image,int div=64);


//锐化  用到拉普拉斯算子  5*cur-left-right-top-bottom
void colorSharpen(Mat &image,Mat &result);

//灰度图像翻转  即0变255 255变0
void grayReverse(Mat &oriImage,Mat &resultImage);

//根据查找表改变图像像素颜色值
void applyLookUp(Mat &image,Mat &lookup,Mat &resultImage);

//直方图均衡化  增强对比度     将直方图均衡化  最理想状态就是每个颜色含量都一样  
void applyEqualize(Mat &image,Mat &resultImage);

#endif /* CVImageColorOperations_hpp */
