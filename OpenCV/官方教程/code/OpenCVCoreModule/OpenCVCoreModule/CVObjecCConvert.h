//
//  CVObjecCConvert.h
//  OpenCVCoreModule
//
//  Created by aa on 16/10/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVImageConvert.h"
#include "CVMaskOperations.hpp"
#include "CVAddOperations.hpp"
#include "CVContrastBrightnessOperations.hpp"
#include "CVDFTOperations.hpp"
#include "CVBlurOperations.hpp"
#include "CVPyramidsOperations.hpp"
#include "CVSobelOperations.hpp"
#include "CVLapulaceOperations.hpp"
#include "CVCannyOperations.hpp"
#include "CVRemappingOperations.hpp"

@interface CVObjecCConvert : NSObject

@property (nonatomic,strong) UIImage *oriImage;
@property (nonatomic,strong) UIImage *oriImage2;

- (cv::Mat)grayMatFromOriImage;
- (cv::Mat)rgbMatFromOriImage;
- (cv::Mat)rgbaMatFromOriImage;

- (UIImage *)maskOperation;
- (UIImage *)getLinearBlendingImage;
- (UIImage *)getImageWithContrast:(float)con brigtness:(float)bri;
- (UIImage *)getImageDFTMagImage;

- (UIImage *)getBlurImage;
- (UIImage *)getGaussianBlurImage;
- (UIImage *)getMedianBlurImage;

- (UIImage *)getPyrUpImage;
- (UIImage *)getPyrDownImage;

- (UIImage *)getSobelImage;
- (UIImage *)getLapulaceImage;
- (UIImage *)getCannyImage;

- (UIImage *)getRLReverseImage;
- (UIImage *)getUDReverseImage;
- (UIImage *)getLRUDReverseImage;

@end
