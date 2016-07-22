//
//  MapTileImageView.h
//  GoogleTMS
//
//  Created by aa on 16/7/19.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapTileImageView : UIImageView

@property (nonatomic,strong) NSString       *mapTileImageUrlString;

@property (nonatomic,assign) int             mapLevel;

@property (nonatomic,assign) int             xIndex;
@property (nonatomic,assign) int             yIndex;

@end
