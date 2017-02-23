//
//  lzhFindPageTableHeader.m
//  suipianTest
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "lzhFindPageTableHeader.h"
#import <Masonry.h>
@implementation lzhFindPageTableHeader

- (instancetype)initWithFrame:(CGRect)frame isFindPerson:(BOOL)isFindPerson
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        //背景基view
        self.baseView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height * 0.25, self.frame.size.width, self.frame.size.height * 0.75)];
        self.baseView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.baseView];
        //左边图片
        self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, self.baseView.frame.size.height * 0.35, self.baseView.frame.size.height * 0.35)];
        //self.leftImageView.backgroundColor = [UIColor grayColor];
        self.leftImageView.center = CGPointMake(self.leftImageView.center.x, self.baseView.frame.size.height * 0.5) ;
        [self.baseView addSubview:self.leftImageView];
        //左边标题
        self.leftTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.leftImageView.frame.origin.x + self.leftImageView.frame.size.width + 10, self.leftImageView.frame.origin.y, 100, self.leftImageView.frame.size.height)];
        self.leftTitleLabel.center = CGPointMake(self.leftTitleLabel.center.x, self.leftImageView.center.y);
        //self.leftTitleLabel.backgroundColor = [UIColor grayColor];
        [self.baseView addSubview:self.leftTitleLabel];
        //右边更多按钮
        self.moreButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.moreButt.frame = CGRectMake(self.baseView.frame.size.width - 50, self.leftTitleLabel.frame.origin.y, 45, self.leftTitleLabel.frame.size.height);
        [self.moreButt setTitle:@"更多" forState:UIControlStateNormal];
        //self.moreButt.backgroundColor = [UIColor grayColor];
        [self.moreButt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.baseView addSubview:self.moreButt];
        //底部间隔view
        self.bottomLineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.baseView.frame.size.height - 3, self.baseView.frame.size.width, 3)];
        self.bottomLineView.backgroundColor = [UIColor blueColor];
        [self.baseView addSubview:self.bottomLineView];
        //适配
        [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.height.mas_equalTo(self).multipliedBy(0.75);
        }];
        //招聘图片单处理
        if(isFindPerson){
            [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self).offset(10);
                make.height.mas_equalTo(self.baseView).multipliedBy(0.35);
                make.width.mas_equalTo(self.leftImageView.mas_height).multipliedBy(1.29);
                make.centerY.mas_equalTo(self.baseView);
            }];
        }else{
            [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self).offset(10);
                make.height.mas_equalTo(self.baseView).multipliedBy(0.35);
                make.width.mas_equalTo(self.leftImageView.mas_height);
                make.centerY.mas_equalTo(self.baseView);
            }];
            
        }
        //
        [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(5);
            make.right.mas_equalTo(self.baseView.mas_centerX);
            make.top.bottom.mas_equalTo(self.leftImageView);
        }];
       //
       [self.moreButt mas_makeConstraints:^(MASConstraintMaker *make) {
           make.width.mas_equalTo(self.baseView.mas_width).multipliedBy(0.1);
           make.right.mas_equalTo(self.baseView.mas_right).offset(-5);
           make.top.bottom.mas_equalTo(self.leftTitleLabel);
       }];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
