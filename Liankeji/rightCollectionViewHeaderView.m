//
//  rightCollectionViewHeaderView.m
//  Liankeji
//
//  Created by mac on 2017/2/21.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "rightCollectionViewHeaderView.h"
#import <Masonry.h>

@implementation rightCollectionViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //
        self.lzhTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width * 0.3, self.frame.size.height * 0.8)];
        //self.lzhTitleLabel.backgroundColor = [UIColor grayColor];
        self.lzhTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.lzhTitleLabel];
        //
        UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, 1)];
        lineView1.backgroundColor = [UIColor grayColor];
        [self addSubview:lineView1];
        //
        UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, 1)];
        lineView2.backgroundColor = [UIColor grayColor];
        [self addSubview:lineView2];
        //
        [self.lzhTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self).multipliedBy(0.3);
            make.height.mas_equalTo(self).multipliedBy(0.8);
            make.center.mas_equalTo(self);
        }];
        //
        [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.right.mas_equalTo(self.lzhTitleLabel.mas_left);
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(1);
        }];
        
        [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self);
            make.left.mas_equalTo(self.lzhTitleLabel.mas_right);
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(1);
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
