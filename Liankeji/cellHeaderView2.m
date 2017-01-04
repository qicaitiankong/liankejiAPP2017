//
//  cellHeaderView2.m
//  Liankeji
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "cellHeaderView2.h"

@implementation cellHeaderView2

- (instancetype)initWithFrame:(CGRect)frame  lable1Height:(CGFloat)height1 lable2Height:(CGFloat)height2
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(246, 246, 246, 1);
        
        self.mainTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, self.frame.size.width - 2 * 5, height1)];
        //self.mainTitleLable.backgroundColor = [UIColor blackColor];
        [self addSubview:self.mainTitleLable];
        self.mainTitleLable.font = [UIFont systemFontOfSize:24];
        self.mainTitleLable.numberOfLines = 0;
        
        self.detailContentLable = [[UILabel alloc]initWithFrame:CGRectMake(5, self.mainTitleLable.frame.origin.y + self.mainTitleLable.frame.size.height + 30, self.frame.size.width - 2 * 5, height2)];
        [self addSubview:self.detailContentLable];
        self.detailContentLable.font = [UIFont systemFontOfSize:16];
        self.detailContentLable.textColor = RGBA(32, 32, 32, 1);
        self.detailContentLable.numberOfLines = 0;
        self.detailContentLable.backgroundColor = [UIColor yellowColor];
 
        
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
