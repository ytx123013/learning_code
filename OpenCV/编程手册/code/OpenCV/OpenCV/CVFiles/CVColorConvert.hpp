//
//  CVColorConvert.hpp
//  OpenCV
//
//  Created by aa on 16/9/28.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVColorConvert_hpp
#define CVColorConvert_hpp

#include <stdio.h>
using namespace cv;

class CVColorConvert {
public:
    CVColorConvert();
    
    void CVConvertRGB2GRAY(Mat &grayMat, const Mat &rgbMat);
    
private:
    void init_lookup_tables();
    
    void init_lookup_rgb2gray_tables();
    double lookup_rgb2gray_redtable[256];
    double lookup_rgb2gray_greentable[256];
    double lookup_rgb2gray_bluetable[256];
    uchar safe_convert_rgb2gray(uchar r,uchar g,uchar b);
    
};

#endif /* CVColorConvert_hpp */
