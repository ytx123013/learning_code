//
//  CVMaskOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVMaskOperations.hpp"

void applyMaskOperation(Mat &oriImage,Mat &resImage,Mat &kernel)
{
    filter2D(oriImage, resImage, oriImage.depth(), kernel);
}