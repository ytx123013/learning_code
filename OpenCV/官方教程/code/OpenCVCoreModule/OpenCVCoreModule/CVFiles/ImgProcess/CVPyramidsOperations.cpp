//
//  CVPyramidsOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/31.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVPyramidsOperations.hpp"


void applyUpSample(Mat &image, Mat &resImage, float zoomIn)
{
    pyrUp(image, resImage,Size(image.cols * zoomIn,image.rows * zoomIn));
}

void applyDownSample(Mat &image, Mat &resImage, float zoomOut)
{
    pyrDown(image, resImage,Size(image.cols / zoomOut,image.rows / zoomOut));
}