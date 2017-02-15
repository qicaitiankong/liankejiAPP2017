//
//  cellHeaderView1.m
//  Liankeji
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "cellHeaderView1.h"
#import <Masonry.h>

@interface cellHeaderView1(){
    UIView *spaceView;
}

@end

@implementation cellHeaderView1

//布局顺序：间隙-》头像-》名字->阅读量图片->阅读量->介绍->关注

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //间隙
        spaceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.061 * self.frame.size.height)];
        spaceView.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:spaceView];
        //头像
        self.userImageView = [[UIImageView alloc]init];
        self.userImageView .frame = CGRectMake(5, spaceView.frame.origin.y + spaceView.frame.size.height + 0.05 * self.frame.size.height, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.12);
        self.userImageView .layer.cornerRadius = self.userImageView .frame.size.width / 2;
        self.userImageView .backgroundColor = [UIColor grayColor];
        [self addSubview:self.userImageView ];
        //名字
        self.userNameLable  = [[UILabel alloc]initWithFrame:CGRectMake(self.userImageView .frame.origin.x + self.userImageView.frame.size.width + 5, self.userImageView.frame.origin.y + self.userImageView.frame.size.height / 2, SCREEN_WIDTH * 0.266, self.userImageView.frame.size.height *  0.444)];
        self.userNameLable.textColor = RGBA(46, 46, 46, 1);
        self.userNameLable.font = [UIFont systemFontOfSize:15];
        //self.userNameLable.backgroundColor = [UIColor grayColor];
        [self addSubview:self.userNameLable];
        //阅读量图片
        self.readImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width / 2 + SCREEN_WIDTH * 0.098, self.userImageView.frame.origin.y + self.userImageView.frame.size.height, self.frame.size.width * 0.05, self.readImageView.frame.size.width * 0.789)];
        NSLog(@"阅读量rect= %lf %lf %lf %lf",self.readImageView.frame.origin.x,
              self.readImageView.frame.origin.y,self.readImageView.frame.size.width,self.readImageView.frame.size.height);
       //self.readImageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.readImageView];
        [self.readImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(SCREEN_WIDTH * 0.598);
            make.top.mas_equalTo(self.userImageView.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.05);
            make.height.mas_equalTo(self.readImageView.mas_width).multipliedBy(0.789);
        }];
        //阅读量数字
        self.readLable = [[UILabel alloc]initWithFrame:CGRectMake(self.readImageView.frame.origin.x + self.readImageView.frame.size.width + SCREEN_WIDTH * 0.013, self.readImageView.frame.origin.y, self.frame.size.width - self.readImageView.frame.origin.x - self.readImageView.frame.size.width - SCREEN_WIDTH * 0.013, self.readImageView.frame.size.height)];
        self.readLable.font = [UIFont systemFontOfSize:13];
        self.readLable.textColor = RGBA(94, 94, 94, 1);
        //self.readLable.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.readLable];
        [self.readLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.readImageView.mas_right).offset(2);
            make.right.mas_equalTo(self).offset(-2);
            make.centerY.mas_equalTo (self.readImageView.mas_centerY);
            make.height.mas_equalTo(self.readImageView.mas_height);
        }];
        //lable介绍
        self.introduceLable = [[lzhRedeceTopSpaceLabel alloc]initWithFrame:CGRectMake(self.frame.size.width * 0.066, self.readImageView.frame.origin.y + self.readImageView.frame.size.height, self.frame.size.width / 2 - self.introduceLable.frame.origin.x, self.frame.size.height - self.introduceLable.frame.origin.y - 5)];
        [self.introduceLable setVerticalAlignment:VerticalAlignmentTop];
        //self.introduceLable.textAlignment = NSTextAlignmentLeft;
        self.introduceLable.numberOfLines = 0;
        self.introduceLable.font = [UIFont systemFontOfSize:13];
        self.introduceLable.textColor = RGBA(94, 94, 94, 1);
        //self.introduceLable.backgroundColor = [UIColor redColor];
        [self addSubview:self.introduceLable];
        [self.introduceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(SCREEN_WIDTH * 0.066);
            make.right.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(self.readImageView.mas_bottom);
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-3);
        }];
        //关注
        self.attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.attentionButton.frame = CGRectMake(self.readLable.frame.origin.x, self.readLable.frame.origin.y + self.readImageView.frame.size.height + self.frame.size.height * 0.2, SCREEN_WIDTH * 0.22,self.frame.size.height * 0.1666);
        //self.attentionButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.attentionButton];
        [self.attentionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.readLable.mas_left);
            make.top.mas_equalTo(self.readLable.mas_bottom).offset(self.frame.size.height * 0.2);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.22);
            make.height.mas_equalTo(self.attentionButton.mas_width).multipliedBy(0.362);
        }];
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
