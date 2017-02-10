//
//  announceWindowView.h
//  Liankeji
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//发布窗口上的view

#import <UIKit/UIKit.h>
#import "AnounceButtonView.h"
#import "LogoOutCompleteDelegate.h"

@interface announceWindowView : UIView

@property (assign,nonatomic)id<announceButtonClickDelegate> targetDelegate;
//logo弹出动画退场完成代理
@property (assign,nonatomic)id<logoOutComplete>logoDelegate;
//上一个点击的tabbar按钮索引
@property (assign,nonatomic) NSInteger previousTabbarIndex;

-(instancetype)initWithFrame:(CGRect)frame targetDelegate:(id)_delegate;


@end
