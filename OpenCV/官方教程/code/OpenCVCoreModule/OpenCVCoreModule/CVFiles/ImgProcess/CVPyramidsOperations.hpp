//
//  CVPyramidsOperations.hpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/31.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVPyramidsOperations_hpp
#define CVPyramidsOperations_hpp

#include <stdio.h>

using namespace cv;

void applyUpSample(Mat &image, Mat &resImage, float zoomIn);
void applyDownSample(Mat &image, Mat &resImage, float zoomOut);

#endif /* CVPyramidsOperations_hpp */
