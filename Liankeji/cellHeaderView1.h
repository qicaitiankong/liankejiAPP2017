//
//  cellHeaderView1.h
//  Liankeji
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.

//组头中的第一个view
#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"
#import "lzhRedeceTopSpaceLabel.h"


@interface cellHeaderView1 : UIView

//头像
@property (strong,nonatomic) UIImageView *userImageView;
//关注按钮
@property (strong,nonatomic) UIButton *attentionButton;
//用户名字
@property (strong,nonatomic) UILabel *userNameLable;
//用户介绍
@property (strong,nonatomic) lzhRedeceTopSpaceLabel *introduceLable;
//阅读量图片
@property (strong,nonatomic) UIImageView *readImageView;
//阅读量
@property (strong,nonatomic) UILabel *readLable;

@end
