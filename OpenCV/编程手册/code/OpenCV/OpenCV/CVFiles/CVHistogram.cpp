//
//  CVHistogram.cpp
//  OpenCV
//
//  Created by aa on 16/10/12.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVHistogram.hpp"

Mat Histogram1D::getHistogram(cv::Mat &image)
{
    Mat hist;
    calcHist(&image,                 //输入图像
             1,                     //计算单张图像直方图
             channels,              //通道数量
             Mat(),                 //不使用图像作为掩码
             hist,                  //返回的直方图
             1,                     //1D的直方图  灰度图
             histSize,              //灰度值的数量
             ranges                 //灰度值的范围
             );
    
    return hist;
}

Mat Histogram1D::getHistogramImage(cv::Mat &image)
{
    Mat hist = getHistogram(image);
    
    std::cout << hist << std::endl;
    
    double max = 0;
    double min = 0;
    minMaxLoc(hist, &min, &max);
    Mat histImg(256,256,CV_8U,Scalar(255));
    
    //图像最高点设为90%
    int htp = static_cast<int>(0.9*256);
    
    for (int h = 0; h < histSize[0]; h++) {
        float binVal = hist.at<float>(h);
        int intensity = static_cast<int>(binVal * htp/max);
        line(histImg, Point(h,histSize[0]), Point(h,histSize[0]-intensity), Scalar::all(0));
    }
    return histImg;
}



Mat HistogramRGB::getHistogram(cv::Mat &image)
{
    Mat hist;
    calcHist(&image,                 //输入图像
             1,                     //计算单张图像直方图
             channels,              //通道数量
             Mat(),                 //不使用图像作为掩码
             hist,                  //返回的直方图
             1,                     //
             histSize,              //灰度值的数量
             ranges                 //灰度值的范围
             );
    
    std::cout << hist << std::endl;
    
    return hist;
}