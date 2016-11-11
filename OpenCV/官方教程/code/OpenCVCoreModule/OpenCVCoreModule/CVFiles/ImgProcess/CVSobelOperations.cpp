//
//  CVSobelOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/11/3.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVSobelOperations.hpp"

void applySobelDetectOperation(Mat &image,Mat &resImage)
{
    Mat src = image.clone();
    Mat srcGray;
    //先用高斯模糊去噪
    GaussianBlur(src, src, Size(3,3), 0);
    
    cvtColor(src, srcGray, CV_RGB2GRAY);
    
    
    Mat grad_x,grad_y;
    Mat abs_grad_x,abs_grad_y;
    
    /// 求 X方向梯度
    Scharr( srcGray, grad_x, CV_16S, 1, 0);
    convertScaleAbs( grad_x, abs_grad_x );
    
    /// 求Y方向梯度
    Scharr( srcGray, grad_y, CV_16S, 0, 1);
    convertScaleAbs( grad_y, abs_grad_y );
    
    addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0, resImage);
}