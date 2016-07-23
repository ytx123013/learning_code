//
//  TMSMapTileImageView.m
//  GoogleTMS
//
//  Created by aa on 16/7/22.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import "TMSMapTileImageView.h"
#import <UIImageView+WebCache.h>

@implementation TMSMapTileImageView

- (instancetype)initWithInfoModel:(MapTileInfoModel *)model
{
    if (self = [super init]) {
        self.infoModel = model;
        self.frame = CGRectMake(model.mapTileOrigin.x, model.mapTileOrigin.y
                                , model.mapTileSize.width, model.mapTileSize.height);
    }
    return self;
}

- (void)loadMapTileImage
{
    [self sd_setImageWithURL:[NSURL URLWithString:self.infoModel.mapTileURLString]];
}

@end
