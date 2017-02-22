//
//  lzhFindPageTableHeader.h
//  suipianTest
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//发现主页面tatble组头(适配完成)

#import <UIKit/UIKit.h>

@interface lzhFindPageTableHeader : UIView
//背景view
@property (strong,nonatomic)UIView *baseView;
//左边图片
@property (strong,nonatomic)UIImageView *leftImageView;
//左边标题
@property (strong,nonatomic)UILabel *leftTitleLabel;
//右边更多按钮
@property(strong,nonatomic)UIButton *moreButt;
//底部间隔view
@property (strong,nonatomic)UIView *bottomLineView;

//企业招聘设为YES,其他为NO
- (instancetype)initWithFrame:(CGRect)frame isFindPerson:(BOOL)isFindPerson;

@end
