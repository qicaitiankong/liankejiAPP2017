//
//  cellHeaderView2.h
//  Liankeji
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//
//表头中的第二个view

#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"
#import "GetCellHeight.h"


@interface cellHeaderView2 : UIView

@property (strong,nonatomic) UILabel *mainTitleLable;

@property (strong,nonatomic) UILabel *detailContentLable;

- (instancetype)initWithFrame:(CGRect)frame  lable1Height:(CGFloat)height1 lable2Height:(CGFloat)height2;
@end
