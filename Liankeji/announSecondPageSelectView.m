//
//  announSecondPageSelectView.m
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "announSecondPageSelectView.h"

@implementation announSecondPageSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ownSelectButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.ownSelectButt.frame = CGRectMake(0, 0, 20, 20);
        self.ownSelectButt.center = CGPointMake(self.ownSelectButt.center.x, self.frame.size.height / 2);
        self.ownSelectButt.backgroundColor = [UIColor whiteColor];
        self.ownSelectButt.layer.borderWidth = 1;
        self.ownSelectButt.layer.borderColor = [UIColor grayColor].CGColor;
        [self.ownSelectButt addTarget:self action:@selector(selectButtHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.ownSelectButt];
        //label
        self.ownContentLabe = [[UILabel alloc]initWithFrame:CGRectMake(self.ownSelectButt.frame.origin.x + self.ownSelectButt.frame.size.width + 2, 2, self.frame.size.width - self.ownSelectButt.frame.origin.x - self.ownSelectButt.frame.size.width - 2, self.frame.size.height  - 2 * 2)];
        //self.ownContentLabe.backgroundColor = [UIColor grayColor];
        self.ownContentLabe.numberOfLines = 2;
        self.ownContentLabe.textColor = [UIColor lightGrayColor];
        self.ownContentLabe.font = [UIFont systemFontOfSize:10];
        [self addSubview:self.ownContentLabe];
    }
    return self;
}
- (void)selectButtHandler:(UIButton*)_b{
    self.isSelected = !_isSelected;
    if(self.isSelected){
        [self.ownSelectButt setImage:[UIImage imageNamed:@"announSecondPageSelectTrue"] forState:UIControlStateNormal];
    }else{
        [self.ownSelectButt setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
