//
//  CVImageMake.hpp
//  OpenCV
//
//  Created by aa on 16/10/9.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVImageMake_hpp
#define CVImageMake_hpp

#include <stdio.h>

using namespace cv;

//制造椒盐噪点  即随机将图像中的某些像素设置为白色或者黑色
//n为白色噪点数量
void createSaltNoise(Mat &image,int n);



#endif /* CVImageMake_hpp */
