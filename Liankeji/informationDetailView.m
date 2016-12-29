//
//  informationDetailView.m
//  Liankeji
//
//  Created by mac on 2016/12/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationDetailView.h"

@implementation informationDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.8;
        CGFloat imageWidth = 100;
        CGFloat imageHeight = 100;
        self.displayImageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - imageWidth) / 2, 30, imageWidth, imageHeight)];
        self.displayImageView.center = CGPointMake(frame.size.width / 2, frame.size.height / 2);
        [self addSubview:self.displayImageView];
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
