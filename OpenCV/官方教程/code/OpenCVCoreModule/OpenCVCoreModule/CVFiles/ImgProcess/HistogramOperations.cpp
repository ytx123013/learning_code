//
//  HistogramOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/11/10.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "HistogramOperations.hpp"

void applyCalcGrayHistogram(Mat &image,Mat &histImage)
{
    int histSize = 255;
    
    float range[] = {0,255};
    const float *histRange = {range};
    
    Mat grayHist;
    
    calcHist(&image, 1, 0, Mat(), grayHist, 1, &histSize, &histRange);
    
    //创建直方图画布
    int hist_w = 400;
    int hist_h = 400;
    Mat hImage(hist_w,hist_h,CV_8UC1,Scalar::all(0));
    
    normalize(grayHist, grayHist, 0, NORM_MINMAX);
    
    for (int i = 0; <#condition#>; <#increment#>) {
        <#statements#>
    }
    
    
}