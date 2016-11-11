//
//  CVColorDetector.hpp
//  OpenCV
//
//  Created by aa on 16/10/10.
//  Copyright © 2016年 yunlian. All rights reserved.
//
//
//  计算图像中包含指定颜色一定范围内的二值图像
//  即指定颜色的一定范围内的颜色设置为黑色
//
//
//

#ifndef CVColorDetector_hpp
#define CVColorDetector_hpp

#include <stdio.h>

using namespace cv;

class ColorDetector {
private:
    //最小可接受的距离
    int minDist;
    
    //目标颜色
    Vec3b target;
    
    //输出图像
    Mat result;
public:
    ColorDetector():minDist(100){
        setTargetColor(0, 0, 0);
    }
    
    void setMinDistance(int);
    int getMinDistance();
    
    void setTargetColor(uchar red,uchar green,uchar blue);
    Vec3b getTargetColor();
    
    Mat getResultImage();
    
    Mat process(Mat &image);
    
    int getDistance(Vec4b &color);
};

#endif /* CVColorDetector_hpp */
