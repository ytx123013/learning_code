//
//  CVLapulaceOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/11/3.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVLapulaceOperations.hpp"

void applyLapulaceOperations(Mat &image,Mat &resImage)
{
    Mat src = image.clone();
    Mat srcGray;
    //先用高斯模糊去噪
    GaussianBlur(src, src, Size(3,3), 0);
    
    cvtColor(src, srcGray, CV_RGB2GRAY);

    Mat res;
    Laplacian(srcGray, res, CV_16S,3);
    convertScaleAbs(res, resImage);
}