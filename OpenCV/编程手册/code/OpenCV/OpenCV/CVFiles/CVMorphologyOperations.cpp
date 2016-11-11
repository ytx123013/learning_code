//
//  CVMorphologyOperations.cpp
//  OpenCV
//
//  Created by aa on 16/10/18.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVMorphologyOperations.hpp"

void applyOpenOperation(Mat &image,Mat &resultImage,Mat &element)
{
    morphologyEx(image, resultImage, MORPH_OPEN, element);
}

void applyCloseOperation(Mat &image,Mat &resultImage,Mat &element)
{
    morphologyEx(image, resultImage, MORPH_CLOSE, element);
}

void applyGradientOperation(Mat &image,Mat &resImage,Mat &element)
{
    morphologyEx(image, resImage, MORPH_GRADIENT, element);
}

void applyTopHatOperation(Mat &image,Mat &resImage,Mat &element)
{
    morphologyEx(image, resImage, MORPH_TOPHAT, element);
}