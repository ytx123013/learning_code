//
//  CVBlurOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/26.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVBlurOperations.hpp"

void applyNormalizedBoxBlur(Mat &image, Mat &resImage)
{
    
    blur(image, resImage, Size(5,5));
}

void applyGaussianBlur(Mat &image, Mat &resImage)
{
    GaussianBlur(image, resImage, Size(5,5), 1);
}

void applyMedianBlur(Mat &image,Mat &resImage)
{
    medianBlur(image, resImage, 5);
}

void applyBilateralBlur(Mat &image,Mat &resImage)
{
    
}