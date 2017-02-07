//
//  infomaFirstPageViewForCell.h
//  Liankeji
//
//  Created by mac on 2017/2/7.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//cell中盛放浏览量等3个view的父view

#import <UIKit/UIKit.h>
#import "ownImageviewAndLableView.h"

@interface infomaFirstPageViewForCell : UIView

@property (strong,nonatomic) NSMutableArray *viewArr ;


@property (strong,nonatomic) ownImageviewAndLableView *firstSmallDisplayView;

@property (strong,nonatomic) ownImageviewAndLableView *secondSmallDisplayView;

@property (strong,nonatomic) ownImageviewAndLableView *thirdSmallDisplayView;


@end
