//
//  personalSmallViewOfFirstPage.m
//  Liankeji
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "personalSmallViewOfFirstPage.h"
#import <Masonry.h>

@implementation personalSmallViewOfFirstPage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.firstLabelOfNum = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.4)];
        self.firstLabelOfNum.textAlignment = NSTextAlignmentCenter;
        //self.firstLabelOfNum.backgroundColor = [UIColor grayColor];
        [self addSubview:self.firstLabelOfNum];
        
        self.secondLabelOfTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.firstLabelOfNum.frame.origin.x, self.firstLabelOfNum.frame.origin.y + self.firstLabelOfNum.frame.size.height, self.firstLabelOfNum.frame.size.width, self.frame.size.height - self.firstLabelOfNum.frame.origin.y - self.firstLabelOfNum.frame.size.height)];
        self.secondLabelOfTitle.textAlignment = NSTextAlignmentCenter;
        //self.secondLabelOfTitle.backgroundColor = [UIColor grayColor];
        [self addSubview:self.secondLabelOfTitle];
        [self lzhMakeConstrains];
    }
    return self;
}
- (void)lzhMakeConstrains{
    [self.firstLabelOfNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.height.mas_equalTo(self).multipliedBy(0.4);
    }];
    
    [self.secondLabelOfTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.firstLabelOfNum.mas_bottom).offset(self.frame.size.height * 0.2);
        make.bottom.mas_equalTo(self);
    }];

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
