//
//  CVUtil.hpp
//  OpenCV
//
//  Created by aa on 16/9/28.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#ifndef CVUtil_hpp
#define CVUtil_hpp

#include <stdio.h>
#include <string>

using namespace std;
using namespace cv;

double get_cv_start_operation_tick();
double get_cv_operation_time_with_start_tick(double startTick);
void print_cv_operation_time_with_start_tick(const char *operation_name, double startTick);




#endif /* CVUtil_hpp */
