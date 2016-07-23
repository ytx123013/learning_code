//
//  TMSMapTileImageView.h
//  GoogleTMS
//
//  Created by aa on 16/7/22.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapTileInfoModel.h"

@interface TMSMapTileImageView : UIImageView

@property (nonatomic,strong) MapTileInfoModel       *infoModel;

- (instancetype)initWithInfoModel:(MapTileInfoModel *)model;

- (void)loadMapTileImage;

@end
