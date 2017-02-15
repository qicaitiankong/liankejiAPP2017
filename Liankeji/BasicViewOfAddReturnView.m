//
//  BasicViewOfAddReturnView.m
//  Liankeji
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "BasicViewOfAddReturnView.h"
#import "appCommonAttributes.h"

@implementation BasicViewOfAddReturnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.frame.size.width, NAVIGATION_HEIGHT)];
        [self.returnView.ownButt setTitle:@"返回" forState:UIControlStateNormal];
        [self.returnView.ownButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:self.returnView];
        
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
