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
        //self.backgroundColor = [UIColor greenColor];
        self.mainTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 0.026, SCREEN_HEIGHT * 0.023, self.frame.size.width - 2 * SCREEN_WIDTH * 0.026, height1)];
        //self.mainTitleLable.backgroundColor = [UIColor blackColor];
        self.mainTitleLable.font = [UIFont systemFontOfSize:24];
        self.mainTitleLable.numberOfLines = 0;
        [self addSubview:self.mainTitleLable];
        //
        self.detailContentLable = [[UILabel alloc]initWithFrame:CGRectMake(self.mainTitleLable.frame.origin.x, self.mainTitleLable.frame.origin.y + self.mainTitleLable.frame.size.height + 0.049 * SCREEN_HEIGHT, self.frame.size.width - 2 * self.mainTitleLable.frame.origin.x, height2)];
        self.detailContentLable.font = [UIFont systemFontOfSize:16];
        self.detailContentLable.textColor = RGBA(32, 32, 32, 1);
        self.detailContentLable.numberOfLines = 0;
        [self addSubview:self.detailContentLable];
        
              //self.detailContentLable.backgroundColor = [UIColor yellowColor];
 
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
