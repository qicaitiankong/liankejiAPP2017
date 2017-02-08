//
//  lzhTableHeaderViewForFirstPage.h
//  Liankeji
//
//  Created by mac on 2017/2/8.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//表头的view

#import <UIKit/UIKit.h>
#import "scinenceHeaderView.h"
#import "firstPageButtonGroup.h"
#import "newAnnouncementView.h"
#import "FFScrollView.h"

@interface lzhTableHeaderViewForFirstPage : UIView
//科技头条
@property (strong,nonatomic)scinenceHeaderView*scinenceView;
//表头
@property (strong,nonatomic)UIView *tableHeaderView;
//中间按钮组
@property (strong,nonatomic)firstPageButtonGroup *groupButton;
//轮播图
@property (strong,nonatomic)FFScrollView *scoView;
//公告VIEW
@property (strong,nonatomic)newAnnouncementView* anounceView;
//代理
@property (assign,nonatomic)id targetDelega;

- (instancetype)initWithFrame:(CGRect)frame targetDelegate:(id)_delegate;

@end
