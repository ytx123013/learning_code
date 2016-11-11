//
//  CVCannyOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/11/4.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVCannyOperations.hpp"

void applyCannyOperation(Mat &image,Mat &resImage)
{
    int lowThreshold = 30;
    int ratio = 2;
    int kernel_size = 3;
    
    Mat src = image.clone();
    Mat srcGray;
    
    
    //降噪
    GaussianBlur(src, src, Size(3,3), 0);
    
    cvtColor(src, srcGray, CV_RGB2GRAY);
    
    Mat res;
    Canny(srcGray, resImage, lowThreshold, lowThreshold * ratio, kernel_size);
    
//    res.copyTo(resImage, res);
    
//    convertScaleAbs(res, resImage);
}
