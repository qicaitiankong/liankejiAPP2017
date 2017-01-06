//
//  commentView.h
//  Liankeji
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//
//下部的支持评论区VIEW
#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"

@interface commentView : UIView
//评论区遮罩按钮
@property (strong,nonatomic)UIButton *transParentButt;
//打赏按钮
@property (strong,nonatomic)UIButton *givePraiseButton;

@end
