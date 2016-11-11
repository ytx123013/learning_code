//
//  CVContrastBrightnessOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVContrastBrightnessOperations.hpp"

void applyChangeContrastAndBrightnessOperation(Mat &oriImage,Mat &resImage,float alpha,float beta)
{
    for (int row = 0; row < oriImage.rows; row++) {
        for (int col = 0; col < oriImage.cols; col++) {
            for (int i = 0; i < 3; i++) {
                resImage.at<Vec3b>(row,col)[i] = saturate_cast<uchar>(alpha*oriImage.at<Vec3b>(row,col)[i] + beta);
            }
        }
    }
}