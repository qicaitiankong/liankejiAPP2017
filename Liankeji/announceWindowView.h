//
//  announceWindowView.h
//  Liankeji
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//发布窗口上的view

#import <UIKit/UIKit.h>
#import "AnounceButtonView.h"

@interface announceWindowView : UIView

@property (assign,nonatomic)id<announceButtonClickDelegate> targetDelegate;

-(instancetype)initWithFrame:(CGRect)frame targetDelegate:(id)_delegate;
@end
