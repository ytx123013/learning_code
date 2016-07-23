//
//  TMSMapScrollView.h
//  GoogleTMS
//
//  Created by aa on 16/7/22.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMSMapTileImageView.h"
#import "TMSBaseMapView.h"
#import "TMSMapTileImageView.h"

@interface TMSMapScrollView : UIScrollView

@property (nonatomic,strong) TMSBaseMapView             *baseMapView;

- (void)initalMapView;

- (void)addMapTileImageView:(TMSMapTileImageView *)mapTile;

@end
