//
//  lzhShadeButton.m
//  Liankeji
//
//  Created by mac on 2017/2/13.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhShadeButton.h"

@implementation lzhShadeButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
        butt.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.4;
        [self addSubview:butt];
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
