//
//  announSecondPageSelectView.h
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//发布二级页面中选择框view

#import <UIKit/UIKit.h>

@interface announSecondPageSelectView : UIView

@property (strong,nonatomic)UIButton *ownSelectButt;

@property (strong,nonatomic)UILabel *ownContentLabe;
//是否选中
@property (assign,nonatomic)BOOL isSelected;
@end
