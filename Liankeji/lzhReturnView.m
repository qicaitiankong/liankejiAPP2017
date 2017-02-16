//
//  lzhReturnView.m
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhReturnView.h"
#import <Masonry.h>

@implementation lzhReturnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.ownButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.ownButt.frame = CGRectMake(5, 5, 50, self.frame.size.height - 2 * 5);
        self.ownButt.center = CGPointMake(self.ownButt.center.x, self.frame.size.height / 2);
        [self.ownButt setTitle:@"返回" forState:UIControlStateNormal];
        //self.ownButt.backgroundColor = [UIColor grayColor];
        [self addSubview:self.ownButt];
        
        self.ownTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width / 2, self.ownButt.frame.origin.y, 100, self.frame.size.height  - self.ownButt.frame.origin.y * 2)];
        self.ownTitleLabel.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        self.ownTitleLabel.textAlignment = NSTextAlignmentCenter;
        //self.ownTitleLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:self.ownTitleLabel];
        //
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        //
        [self.ownButt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.width.mas_equalTo(self).multipliedBy(0.2);
            make.height.mas_equalTo(self).multipliedBy(0.8);
            make.centerY.mas_equalTo(self);
        }];
        [self.ownTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self).multipliedBy(0.4);
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(self).multipliedBy(0.8);
            make.centerY.mas_equalTo(self);
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
