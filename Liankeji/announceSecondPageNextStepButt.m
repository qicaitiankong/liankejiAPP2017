//
//  announceSecondPageNextStepButt.m
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "announceSecondPageNextStepButt.h"

@implementation announceSecondPageNextStepButt

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.previousButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.previousButt.frame = CGRectMake(0, 0, self.frame.size.width * 0.32, self.frame.size.height);
        [self.previousButt setTitle:@"上一步" forState:UIControlStateNormal];
        self.previousButt.backgroundColor = [UIColor grayColor];
        self.previousButt.userInteractionEnabled = NO;
        [self addSubview:self.previousButt];
        //
        self.nextButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextButt.frame = CGRectMake(self.frame.size.width * (1 - 0.32), 0, self.frame.size.width * 0.32, self.frame.size.height);
        self.nextButt.backgroundColor = [UIColor grayColor];
        self.nextButt.userInteractionEnabled = NO;
        [self addSubview:self.nextButt];
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
