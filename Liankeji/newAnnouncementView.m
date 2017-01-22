//
//  newAnnouncementView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/19.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "newAnnouncementView.h"
#import "appCommonAttributes.h"

@implementation newAnnouncementView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc]init];
        //imageView.backgroundColor = [UIColor grayColor];
        [imageView setImage:[UIImage imageNamed:@"1_25"]];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(SCREEN_WIDTH * 0.047);
            make.height.equalTo(self).multipliedBy(0.6);
            make.width.equalTo(imageView.mas_height);
            make.centerY.equalTo(self);
        }];
        //最新公告轮播
        self.textScrollView = [[LMJScrollTextView alloc]initWithFrame:CGRectMake(0,0,0,0) textScrollModel:LMJTextScrollFromOutside direction:LMJTextScrollMoveLeft];
        self.textScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textScrollView];
        [self.textScrollView setMoveSpeed:0.2];
        [self.textScrollView startScrollWithText:@"最新公告：链科技正在打造国际一流技术对接平台，期望您的加入！" textColor: [UIColor lightGrayColor] font:[UIFont boldSystemFontOfSize:16]];
        NSLog(@"最新公告间距%lf",SCREEN_WIDTH * 0.033);
         //NSLog(@"imageview width = %lf",imageView.bounds.size.width);
        [self.textScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(SCREEN_WIDTH * 0.047 + SCREEN_WIDTH * 0.033 + self.frame.size.height * 0.6);
            make.right.equalTo(self).offset(-5);
            make.height.equalTo(imageView);
            make.centerY.equalTo(self);
        }];
        //添加灰色线
        UIView *styleLine = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - 1 , frame.size.width, 1)];
        styleLine.backgroundColor = [UIColor grayColor];
        [self addSubview:styleLine];
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
