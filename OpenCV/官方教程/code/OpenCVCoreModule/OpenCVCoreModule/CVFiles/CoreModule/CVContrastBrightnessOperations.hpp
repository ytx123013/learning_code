//
//  CVContrastBrightnessOperations.hpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVContrastBrightnessOperations_hpp
#define CVContrastBrightnessOperations_hpp

#include <stdio.h>

using namespace cv;

void applyChangeContrastAndBrightnessOperation(Mat &oriImage,Mat &resImage,float alpha,float beta);

#endif /* CVContrastBrightnessOperations_hpp */
