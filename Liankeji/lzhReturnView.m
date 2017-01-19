//
//  lzhReturnView.m
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhReturnView.h"

@implementation lzhReturnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
