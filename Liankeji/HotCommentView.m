//
//  HotCommentView.m
//  Liankeji
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "HotCommentView.h"


@implementation HotCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *spaceLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 2)];
        spaceLineView.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:spaceLineView];
        
        UILabel *hotLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 2, 150, self.frame.size.height - 4)];
        hotLabel.center = CGPointMake(hotLabel.center.x, self.frame.size.height / 2);
        hotLabel.font = [UIFont systemFontOfSize:15];
        hotLabel.text = @"热门评论";
        hotLabel.textColor = [UIColor redColor];
        [self addSubview:hotLabel];
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
