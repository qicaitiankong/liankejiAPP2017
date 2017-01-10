//
//  exchangeView1.m
//  Liankeji
//
//  Created by mac on 2017/1/10.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "exchangeView1.h"

@implementation exchangeView1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.95;
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 200, 150, 100)];
        self.ownImageView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        self.ownImageView.backgroundColor = [UIColor blueColor];
        [self addSubview:self.ownImageView];
    }
    return self;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.ownDelegate){
        [self.ownDelegate exchangeViewHandler:self];
    }
    NSLog(@"点击结束");
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"移动中");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
