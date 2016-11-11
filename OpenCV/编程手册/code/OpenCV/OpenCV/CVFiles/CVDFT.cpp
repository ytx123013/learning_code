//
//  CVDFT.cpp
//  OpenCV
//
//  Created by aa on 16/10/20.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVDFT.hpp"

void cvDFT(Mat &image)
{
    Mat padded;
    int rows = getOptimalDFTSize(image.rows);       //增加dft效率类似于fft 需要对行和列对数进行优化  补零
    int cols = getOptimalDFTSize(image.cols);
    copyMakeBorder(image, padded, 0, rows-image.rows, 0, cols-image.cols, BORDER_CONSTANT,Scalar::all(0));      //填充目标mat
    
    
}