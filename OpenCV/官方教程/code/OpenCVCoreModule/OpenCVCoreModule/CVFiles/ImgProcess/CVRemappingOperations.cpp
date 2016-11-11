//
//  CVRemappingOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/11/9.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVRemappingOperations.hpp"

void applyLRReverse(Mat &image,Mat &resImage)
{
    Mat xMap(image.size(),CV_32FC1,Scalar::all(0));
    Mat yMap(image.size(),CV_32FC1);
    
    for (int row = 0; row < image.rows; row++) {
        for (int col = 0; col < image.cols; col++) {
            xMap.at<float>(row,col) = image.cols - col;
            yMap.at<float>(row,col) = row;
//            xMap.at<float>(row,col) = row;
        }
    }
    
    applyRemapping(image, resImage, xMap, yMap);
}

void applyUDReverse(Mat &image,Mat &resImage)
{
    Mat xMap(image.size(),CV_32FC1);
    Mat yMap(image.size(),CV_32FC1);
    
    for (int row = 0; row < image.rows; row++) {
        for (int col = 0; col < image.cols; col++) {
            xMap.at<float>(row,col) = col;
            yMap.at<float>(row,col) = image.rows - row;
        }
    }
    
    applyRemapping(image, resImage, xMap, yMap);
}

void applyLRUDReverse(Mat &image,Mat &resImage)
{
    Mat xMap(image.size(),CV_32FC1);
    Mat yMap(image.size(),CV_32FC1);
    
    for (int row = 0; row < image.rows; row++) {
        for (int col = 0; col < image.cols; col++) {
            xMap.at<float>(row,col) = image.cols - col;
            yMap.at<float>(row,col) = image.rows - row;
        }
    }
    
    applyRemapping(image, resImage, xMap, yMap);
}

void applyRemapping(Mat &image,Mat &resImage,Mat &xMap,Mat &yMap)
{
    remap(image, resImage, xMap, yMap, CV_INTER_LINEAR);
}