//
//  CVThresholding.cpp
//  OpenCV
//
//  Created by aa on 16/10/18.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVThresholding.hpp"

void applyThresholdBinary(Mat &image,Mat &resImage,int threshold,int maxValue)
{
    cv::threshold(image, resImage, threshold, maxValue, THRESH_BINARY);
}