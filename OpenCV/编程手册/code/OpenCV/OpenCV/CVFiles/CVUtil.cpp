//
//  CVUtil.cpp
//  OpenCV
//
//  Created by aa on 16/9/28.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#include "CVUtil.hpp"

using namespace cv;

double get_cv_start_operation_tick()
{
    return (double)getTickCount();
}

double get_cv_operation_time_with_start_tick(double startTick)
{
    double time = ((double)getTickCount() - startTick)/getTickFrequency();
    return time;
}

void print_cv_operation_time_with_start_tick(const char *operation_name, double startTick)
{
    double cost_time = get_cv_operation_time_with_start_tick(startTick);
    cout << "Time of operation " << operation_name << " runs "
    << cost_time << " seconds."<< endl;
}