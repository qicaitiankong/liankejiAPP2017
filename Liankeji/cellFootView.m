//
//  cellFootView.m
//  Liankeji
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "cellFootView.h"

@implementation cellFootView
@synthesize footButton;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //分隔线
        UIView *spaceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 2)];
        spaceView.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:spaceView];
        footButton = [UIButton buttonWithType:UIButtonTypeCustom];
        footButton.frame = CGRectMake(0, 0,self.frame.size.width * 0.55, self.frame.size.height * 0.3) ;
        footButton.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        [footButton setTitle:@"查看更多评论>>" forState:UIControlStateNormal];
        UIColor *footButtColor = RGBA(39,150, 208, 1);
        [footButton setTitleColor:footButtColor forState:UIControlStateNormal];
        footButton.titleLabel.font = [UIFont systemFontOfSize:18];
        //footButton.backgroundColor = [UIColor blueColor];
        [self addSubview:footButton];
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
