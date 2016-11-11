//
//  CVObjecCConvert.m
//  OpenCVCoreModule
//
//  Created by aa on 16/10/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "CVObjecCConvert.h"

@implementation CVObjecCConvert

- (cv::Mat)grayMatFromOriImage
{
    cv::Mat grayMat = [CVImageConvert cvGrayMatFromUIImage:self.oriImage];
    return grayMat;
}

- (cv::Mat)rgbMatFromOriImage
{
    cv::Mat rgbMat = [CVImageConvert cvRGBMatFromUIImage:self.oriImage];
    return rgbMat;
}

- (cv::Mat)rgbaMatFromOriImage
{
    cv::Mat rgbaMat = [CVImageConvert cvRGBAMatFromUIImage:self.oriImage];
    return rgbaMat;
}

- (UIImage *)maskOperation
{
    cv::Mat resMat;
    cv::Mat oriMat = [self rgbMatFromOriImage];
    Mat kernel = (Mat_<char>(3,3) << 0, -1, 0,
                  -1, 5, -1,
                  0, -1, 0);
    applyMaskOperation(oriMat, resMat, kernel);
    
    return [CVImageConvert UIImageFromCVMat:resMat];
}

- (UIImage *)getLinearBlendingImage
{
    cv::Mat img1 = [self rgbMatFromOriImage];
    cv::Mat img2 = [CVImageConvert cvRGBMatFromUIImage:self.oriImage2];
    cv::Mat resMat;
    float alpha = 0.7;
    applyLinearBlendingOperation(img1, alpha, img2, resMat);
    
    return [CVImageConvert UIImageFromCVMat:resMat];
}

- (UIImage *)getImageWithContrast:(float)con brigtness:(float)bri
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img1(img.rows,img.cols,CV_8UC3);
    applyChangeContrastAndBrightnessOperation(img, img1, con, bri);
    return [CVImageConvert UIImageFromCVMat:img1];
}

- (UIImage *)getImageDFTMagImage
{
    cv::Mat img = [self grayMatFromOriImage];
    cv::Mat img2;
    applyDFTOperation(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getBlurImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyNormalizedBoxBlur(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getGaussianBlurImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyGaussianBlur(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getMedianBlurImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyMedianBlur(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getPyrUpImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyUpSample(img, img2, 2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getPyrDownImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyDownSample(img, img2, 2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getSobelImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applySobelDetectOperation(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getLapulaceImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyLapulaceOperations(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getCannyImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyCannyOperation(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getRLReverseImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyLRReverse(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getUDReverseImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyUDReverse(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

- (UIImage *)getLRUDReverseImage
{
    cv::Mat img = [self rgbMatFromOriImage];
    cv::Mat img2;
    applyLRUDReverse(img, img2);
    return [CVImageConvert UIImageFromCVMat:img2];
}

@end
