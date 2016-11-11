//
//  CVRemappingOperations.hpp
//  OpenCVCoreModule
//
//  Created by aa on 16/11/9.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVRemappingOperations_hpp
#define CVRemappingOperations_hpp

#include <stdio.h>

using namespace cv;

void applyLRReverse(Mat &image,Mat &resImage);
void applyUDReverse(Mat &image,Mat &resImage);
void applyLRUDReverse(Mat &image,Mat &resImage);

void applyRemapping(Mat &image,Mat &resImage,Mat &xMap,Mat &yMap);

#endif /* CVRemappingOperations_hpp */
