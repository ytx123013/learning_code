//
//  CVMorphologyOperations.hpp
//  OpenCV
//
//  Created by aa on 16/10/18.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVMorphologyOperations_hpp
#define CVMorphologyOperations_hpp

#include <stdio.h>

using namespace cv;

void applyOpenOperation(Mat &image,Mat &resultImage,Mat &element);
void applyCloseOperation(Mat &image,Mat &resultImage,Mat &element);

//形态学梯度
void applyGradientOperation(Mat &image,Mat &resImage,Mat &element);

//顶帽变换
void applyTopHatOperation(Mat &image,Mat &resImage,Mat &element);

#endif /* CVMorphologyOperations_hpp */
