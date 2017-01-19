//
//  personalFirstViewOfFirstPage.m
//  Liankeji
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "personalViewOfFirstPage.h"
#import "personalSmallViewOfFirstPage.h"
#import "appCommonAttributes.h"

@implementation personalViewOfFirstPage

- (instancetype)initWithFrame:(CGRect)frame numArr:(NSArray*)numArr titleArray:(NSArray*)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *spaceLine = [[UIView alloc]initWithFrame:CGRectMake(15, 0, self.frame.size.width, 2)];
        spaceLine.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:spaceLine];
        
        CGFloat horizontalSpace = 30;
        for(NSInteger i  = 0 ; i < 3; i ++){
            personalSmallViewOfFirstPage *smallView = [[personalSmallViewOfFirstPage alloc]initWithFrame:CGRectMake(30 + i * (90 + horizontalSpace) ,10, 90, self.frame.size.height  - 10)];
            smallView.firstLabelOfNum.text = numArr[i];
            smallView.secondLabelOfTitle.text = titleArr[i];
            [self addSubview:smallView];
        }
        
        UIView *bottomSpaceLine = [[UIView alloc]initWithFrame:CGRectMake(15, self.frame.size.height - 2, self.frame.size.width, 2)];
        bottomSpaceLine.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:bottomSpaceLine];
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
