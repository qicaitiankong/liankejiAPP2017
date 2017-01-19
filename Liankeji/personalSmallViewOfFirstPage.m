//
//  personalSmallViewOfFirstPage.m
//  Liankeji
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "personalSmallViewOfFirstPage.h"

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
