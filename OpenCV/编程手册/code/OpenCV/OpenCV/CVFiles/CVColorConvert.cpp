//
//  CVColorConvert.cpp
//  OpenCV
//
//  Created by aa on 16/9/28.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVColorConvert.hpp"

CVColorConvert::CVColorConvert()
{
    init_lookup_tables();
}

void CVColorConvert::init_lookup_tables()
{
    init_lookup_rgb2gray_tables();
}

void CVColorConvert::init_lookup_rgb2gray_tables()
{
    //gray = 0.3r + 0.6g + 0.1b
    for (int i = 0; i < 256; i++) {
        lookup_rgb2gray_redtable[i] = 0.3*i;
        lookup_rgb2gray_greentable[i] = 0.6*i;
        lookup_rgb2gray_bluetable[i] = 0.1*i;
    }
}

void CVColorConvert::CVConvertRGB2GRAY(Mat &grayMat, const Mat &rgbMat)
{
    Mat_<Vec4b> _grayMat = grayMat;
    Mat_<Vec4b> _rgbMat = rgbMat;
    for (int i = 0; i < grayMat.rows; i++) {
        for (int j = 0; j < grayMat.cols; j++) {
            Vec3b rgb = rgbMat.at<Vec3b>(i,j);
            uchar gray = safe_convert_rgb2gray(rgb[0], rgb[1], rgb[2]);
//            grayMat.at<uchar>(i,j) = safe_convert_rgb2gray(rgb[0], rgb[1], rgb[2]);
            _grayMat(i,j)[0] = gray;
            _grayMat(i,j)[1] = gray;
            _grayMat(i,j)[2] = gray;
            _grayMat(i,j)[3] = _rgbMat(i,j)[3];
        }
    }
}

uchar CVColorConvert::safe_convert_rgb2gray(uchar r,uchar g,uchar b)
{
    double r1 = lookup_rgb2gray_redtable[r];
    double g1 = lookup_rgb2gray_greentable[g];
    double b1 = lookup_rgb2gray_bluetable[b];
    uchar gray = r1 + g1 + b1;
    if (gray > 255) {
        gray = 255;
    }
    return gray;
}