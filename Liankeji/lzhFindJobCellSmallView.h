//
//  lzhFindJobCellSmallView.h
//  suipianTest
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//()适配完成

#import <UIKit/UIKit.h>

@interface lzhFindJobCellSmallView : UIView
//图标
@property (strong,nonatomic)UIImageView *firstImageView;
//标题
@property (strong,nonatomic)UILabel *secondTitleLabel;
//isSecond:如果是第二个设为YES
- (instancetype)initWithFrame:(CGRect)frame isSecond:(BOOL)isSecond;

@end
