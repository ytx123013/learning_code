//
//  AllWorldMap.h
//  GoogleTMS
//
//  Created by aa on 16/7/21.
//  Copyright © 2016年 yunlian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllWorldMap : UIScrollView

@property (nonatomic,strong) UIImageView        *bgImageView;
@property (nonatomic,strong) NSMutableArray     *mapTilesArray;

- (void)resetViewFrame;

@end
