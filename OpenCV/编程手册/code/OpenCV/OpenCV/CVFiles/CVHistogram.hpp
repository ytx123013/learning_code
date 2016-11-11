//
//  CVHistogram.hpp
//  OpenCV
//
//  Created by aa on 16/10/12.
//  Copyright © 2016年 yunlian. All rights reserved.
//
//
//  直方图
//
//
//
//


#ifndef CVHistogram_hpp
#define CVHistogram_hpp

#include <stdio.h>

#define k8BitMax 256

using namespace cv;
/*
 *  处理灰度图的直方图
 */
class Histogram1D {
private:
    //像素颜色个数  灰度图只取灰度值
    int histSize[1];
    //灰度值的最大和最小值
    float histRange[2];
    
    const float *ranges[1];
    //仅用到一个通道
    int channels[1];
    
    
public:
    Histogram1D(){
        histSize[0] = 256;
        histRange[0] = 0.0;
        histRange[1] = 255.0;
        ranges[0] = histRange;
        channels[0] = 0;
    }
    
    Mat getHistogram(Mat &image);
    Mat getHistogramImage(Mat &image);
};

class HistogramRGB {
private:
    int histSize[3];
    float histRange[2];
    const float *ranges[3];
    int channels[3];
public:
    HistogramRGB(){
        histSize[0] = histSize[1] = histSize[2] = k8BitMax;
        histRange[0] = 0.0;
        histRange[1] = 255.0;
        ranges[0] = histRange;
        ranges[1] = histRange;
        ranges[2] = histRange;
        channels[0] = 0;
        channels[1] = 1;
        channels[2] = 2;
        
    }
    
    Mat getHistogram(Mat &image);
};

#endif /* CVHistogram_hpp */
