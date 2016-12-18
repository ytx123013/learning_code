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
    
    //histSize      每个维度的bin的数目
    //histRange     每个维度的取值范围
    calcHist(&image, 1, 0, Mat(), grayHist, 1, &histSize, &histRange);
    
    std::cout << grayHist.channels() << std::endl;
    
    //创建直方图画布
    int hist_w = 400;
    int hist_h = 400;
    
    int bin_w = cvRound((double)hist_w/histSize);
    Mat hImage(hist_w,hist_h,CV_8UC1,Scalar::all(0));
    
    
    normalize(grayHist, grayHist, 0, hImage.rows, NORM_MINMAX);
    
    for (int i = 1; i < histSize; i++) {
        grayHist.at<float>(i);
        Point prePoint = Point(bin_w*(i-1),hist_h - cvRound(grayHist.at<float>(i-1)));
        Point point = Point(bin_w*(i),hist_h - cvRound(grayHist.at<float>(i)));
        
        line(hImage, prePoint, point, Scalar(255,255,255));
    }
    histImage = hImage;
    
    
}

void applyHistogramEqualization(Mat &image,Mat &resImage)
{
    equalizeHist(image, resImage);
}