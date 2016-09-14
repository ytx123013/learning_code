//
//  TMSMapManager.m
//  GoogleTMS
//
//  Created by aa on 16/7/20.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "TMSMapManager.h"

@interface TMSMapManager()

@end

@implementation TMSMapManager

+ (instancetype)sharedManager
{
    static TMSMapManager *__sharedManager__;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedManager__ = [[TMSMapManager alloc] init];
    });
    return __sharedManager__;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.mapTilesArray = [[NSMutableArray alloc] init];
        self.mapScrollView = [[TMSMapScrollView alloc] init];
    }
    return self;
}

- (void)initData
{
    self.mapTileImageScale = 1.0;
    [self.mapScrollView initalMapView];
}

- (void)resetBaseMapViewWithFrame:(CGRect)frame;
{
    [self.mapScrollView resetBaseMapViewWithFrame:frame];
}

@end
