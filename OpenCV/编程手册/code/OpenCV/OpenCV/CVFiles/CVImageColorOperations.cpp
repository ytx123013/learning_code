//
//  CVImageColorOperations.cpp
//  OpenCV
//
//  Created by aa on 16/10/9.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVImageColorOperations.hpp"
#include "CVUtil.hpp"

void colorReduce(Mat &image,int div)
{
    double start_tick = get_cv_start_operation_tick();
    /* 
     指针遍历
     */
    int row = image.rows;
    int col = image.cols;
    
    for (int x = 0; x < row; x++) {
        for (int y = 0; y < col; y++) {
            Vec4b *data = image.ptr<Vec4b>(x,y);
            (*data)[0] = (*data)[0]/div*div + div/2;
            (*data)[1] = (*data)[1]/div*div + div/2;
            (*data)[2] = (*data)[2]/div*div + div/2;
        }
    }
    
    /*
     迭代器遍历
     */
/*    Mat_<Vec4b>::iterator it = image.begin<Vec4b>();
    Mat_<Vec4b>::iterator itEnd = image.end<Vec4b>();
    while (it != itEnd) {
        (*it)[0] = (*it)[0]/div*div + div/2;
        (*it)[1] = (*it)[1]/div*div + div/2;
        (*it)[2] = (*it)[2]/div*div + div/2;
        it++;
    }*/
    print_cv_operation_time_with_start_tick("ptr", start_tick);
}

void colorSharpen(Mat &image,Mat &result)
{
    /*
     *  使用filter2D  即定义一个kernel 作用于整个图像上
     */
    Mat kernel = (Mat_<char>(3,3) << 0, -1, 0,
                                     -1, 5, -1,
                                     0, -1, 0);
    filter2D(image, result, image.depth(), kernel);
}

void applyLookUp(Mat &image,Mat &lookup,Mat &resultImage)
{
    LUT(image, lookup, resultImage);
}

void grayReverse(Mat &oriImage,Mat &resultImage)
{
    int dim(256);
    Mat lut(1,&dim,CV_8U);
    for (int i = 0; i < 256; i++) {
        lut.at<uchar>(i) = 255 - i;
    }
    
    applyLookUp(oriImage, lut,resultImage);
}

void applyEqualize(Mat &image,Mat &resultImage)
{
    equalizeHist(image, resultImage);
}