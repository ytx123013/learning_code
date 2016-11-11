//
//  CVColorDetector.cpp
//  OpenCV
//
//  Created by aa on 16/10/10.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVColorDetector.hpp"



Mat ColorDetector::process(cv::Mat &image)
{
    result.create(image.rows, image.cols, CV_8U);
    
    Mat_<Vec4b>::iterator it = image.begin<Vec4b>();
    Mat_<Vec4b>::iterator itEnd = image.end<Vec4b>();
    Mat_<uchar>::iterator reIt = result.begin<uchar>();
    while (it != itEnd) {
        if (getDistance(*it) < minDist) {
            *reIt = 255;
        }else{
            *reIt = 0;
        }
        reIt++;
        it++;
    }
    
    return result;
}

void ColorDetector::setTargetColor(uchar red, uchar green, uchar blue)
{
    target[0] = red;
    target[1] = green;
    target[2] = blue;
}

Vec3b ColorDetector::getTargetColor()
{
    return target;
}

void ColorDetector::setMinDistance(int dis)
{
    minDist = dis;
}

int ColorDetector::getMinDistance()
{
    return minDist;
}

int ColorDetector::getDistance(Vec4b &color)
{
    return abs(color[0] - target[0]) + abs(color[1] - target[1]) + abs(color[2] - target[2]);
}

Mat ColorDetector::getResultImage()
{
    return result;
}

