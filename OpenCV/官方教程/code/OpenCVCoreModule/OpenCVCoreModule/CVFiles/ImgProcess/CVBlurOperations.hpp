//
//  CVBlurOperations.hpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/26.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVBlurOperations_hpp
#define CVBlurOperations_hpp

#include <stdio.h>

using namespace cv;

void applyNormalizedBoxBlur(Mat &image, Mat &resImage);
void applyGaussianBlur(Mat &image, Mat &resImage);
void applyMedianBlur(Mat &image,Mat &resImage);
void applyBilateralBlur(Mat &image,Mat &resImage);

#endif /* CVBlurOperations_hpp */
