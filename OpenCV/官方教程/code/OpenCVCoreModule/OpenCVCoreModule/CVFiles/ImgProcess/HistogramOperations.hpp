//
//  HistogramOperations.hpp
//  OpenCVCoreModule
//
//  Created by aa on 16/11/10.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef HistogramOperations_hpp
#define HistogramOperations_hpp

#include <stdio.h>

using namespace cv;

void applyCalcGrayHistogram(Mat &image,Mat &histImage);

void applyHistogramEqualization(Mat &image,Mat &resImage);

#endif /* HistogramOperations_hpp */
