//
//  CVDFTOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVDFTOperations.hpp"

void applyDFTOperation(Mat &image,Mat &magImage)
{
    int row = getOptimalDFTSize(image.rows);
    int col = getOptimalDFTSize(image.cols);
    
    Mat image2;
    copyMakeBorder(image,image2,0,row-image.rows,0,col-image.cols,BORDER_CONSTANT, Scalar::all(0));
    
    Mat planes[] = {Mat_<float>(image2), Mat::zeros(image2.size(), CV_32F)};
    Mat complexI;
    merge(planes,2, complexI);
    
    
    dft(complexI,complexI);
    
    split(complexI,planes);
    magnitude(planes[0],planes[1],planes[0]);
    
    
    magImage = planes[0];
    
    magImage += Scalar::all(1);
    log(magImage,magImage);
    
    magImage = magImage(Rect(0,0,magImage.cols & -2,magImage.rows & -2));
    
    int cx = magImage.cols/2;
    int cy = magImage.rows/2;
    Mat q0(magImage,Rect(0,0,cx,cy));       //左上
    Mat q1(magImage,Rect(cx,0,cx,cy));      //右上
    Mat q2(magImage,Rect(0,cy,cx,cy));      //左下
    Mat q3(magImage,Rect(cx,cy,cx,cy));     //右下
    
    
    //将左上和右下交换    右上和左下交换
    Mat tmp;
    q0.copyTo(tmp);
    q3.copyTo(q0);
    tmp.copyTo(q3);
    
    q1.copyTo(tmp);
    q2.copyTo(q1);
    tmp.copyTo(q2);
    
    normalize(magImage, magImage, 0, 1, CV_MINMAX);
    magImage.convertTo(magImage, CV_8UC1, 255);
}