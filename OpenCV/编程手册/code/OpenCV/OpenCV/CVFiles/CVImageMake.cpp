//
//  CVImageMake.cpp
//  OpenCV
//
//  Created by aa on 16/10/9.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVImageMake.hpp"

void createSaltNoise(Mat &image,int n)
{
    for (int k = 0; k < n; k++) {
        int x = rand()%image.rows;
        int y = rand()%image.cols;
        if (image.channels() == 1) {        //灰度图
            image.at<uchar>(x,y) = 255;
        }else if(image.channels() == 3){        //彩色图
            image.at<Vec3b>(x,y)[0] = 255;
            image.at<Vec3b>(x,y)[1] = 255;
            image.at<Vec3b>(x,y)[2] = 255;
        }else if (image.channels() == 4) {      //彩色图  有阿尔法通道
            image.at<Vec4b>(x,y)[0] = 255;
            image.at<Vec4b>(x,y)[1] = 255;
            image.at<Vec4b>(x,y)[2] = 255;
            image.at<Vec4b>(x,y)[3] = 1;
        }
    }
}
