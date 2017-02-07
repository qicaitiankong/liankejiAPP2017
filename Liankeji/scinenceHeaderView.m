//
//  scinenceHeaderView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/20.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "scinenceHeaderView.h"
#import "appCommonAttributes.h"

@implementation scinenceHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = RGBA(244, 244, 244, 1);
    if(self){
        UILabel *headerLable = [[UILabel alloc]init];
        headerLable.backgroundColor = [UIColor whiteColor];
        headerLable.textAlignment = NSTextAlignmentCenter;
        [headerLable setTextColor:[UIColor blueColor]];
        headerLable.font = [UIFont systemFontOfSize:16];
        headerLable.textColor = RGBA(52, 124, 205, 1);
        headerLable.text = @"科技头条";
        [self addSubview:headerLable];
        [headerLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.width.equalTo(self);
            make.top.equalTo(self).offset(SCREEN_HEIGHT * 0.018);
            make.bottom.equalTo(self).offset(-SCREEN_HEIGHT * 0.018);
        }];
    }
    return  self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
