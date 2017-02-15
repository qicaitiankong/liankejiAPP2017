//
//  ownHeaderViewForCell.h
//  Liankeji
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.

//组头VIEW
#import <UIKit/UIKit.h>
#import "cellHeaderView2.h"
#import "cellHeaderView3.h"
#import "lzhRedeceTopSpaceLabel.h"

@interface ownHeaderViewForCell : UIView
//第一个视图中的属性
@property (strong,nonatomic)UIImageView *firstView0ImageView;

@property (strong,nonatomic)UILabel *firstView0TitleLabel;

@property (strong,nonatomic)UILabel *firstView0AuthorLabel;
//
//头像
@property (strong,nonatomic) UIImageView *userImageView;
//关注按钮
@property (strong,nonatomic) UIButton *attentionButton;
//名字
@property (strong,nonatomic) UILabel *userNameLable;
//介绍
@property (strong,nonatomic) lzhRedeceTopSpaceLabel *introduceLable;
//阅读量图片
//@property (strong,nonatomic) UIImageView *readImageView;
//阅读量
@property (strong,nonatomic) UILabel *readLable;
//组头中的第二个VIEW
@property (strong,nonatomic)cellHeaderView2 *view2;
//第二个VIEW中的标题
@property (strong,nonatomic) UILabel *mainTitleLable;
//第二个VIEW中的具体内容
@property (strong,nonatomic) UILabel *detailContentLable;

- (instancetype)initWithFrame:(CGRect)frame headerView2Height:(CGFloat)_headerView2Height mainTitleLabHeight:(CGFloat)mainLableHeight detailLableHeight:(CGFloat)detailHeight clickDelegate:(id<announceButtonClickDelegate>)ownDelegate;

@end
