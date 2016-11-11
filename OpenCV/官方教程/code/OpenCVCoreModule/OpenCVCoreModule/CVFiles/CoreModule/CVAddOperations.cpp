//
//  CVAddOperations.cpp
//  OpenCVCoreModule
//
//  Created by aa on 16/10/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVAddOperations.hpp"

void applyLinearBlendingOperation(Mat &img1,float img1Alpha, Mat &img2,Mat &resImage)
{
    float beta = 1 - img1Alpha;
    addWeighted(img1, img1Alpha, img2, beta, 0.0, resImage);
}