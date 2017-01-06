//
//  cellHeaderView1.m
//  Liankeji
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "cellHeaderView1.h"
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
        spaceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        spaceView.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:spaceView];
        //头像
        self.userImageView = [[UIImageView alloc]init];
        self.userImageView .frame = CGRectMake(5, spaceView.frame.origin.y + spaceView.frame.size.height + 9, 60, 60);
        self.userImageView .layer.cornerRadius = self.userImageView .frame.size.width / 2;
        //self.userImageView .backgroundColor = [UIColor grayColor];
        [self addSubview:self.userImageView ];
        //名字
        self.userNameLable  = [[UILabel alloc]initWithFrame:CGRectMake(self.userImageView .frame.origin.x + self.userImageView.frame.size.width + 5, self.userImageView.frame.origin.y + self.userImageView.frame.size.height / 2, 200, 40)];
        self.userNameLable.textColor = RGBA(46, 46, 46, 1);
        self.userNameLable.font = [UIFont systemFontOfSize:15];
        //self.userNameLable.backgroundColor = [UIColor grayColor];
        [self addSubview:self.userNameLable];
        //阅读量图片
        self.readImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width / 2 + 30, self.userImageView.frame.origin.y + self.userImageView.frame.size.height, 19, 18)];
        //self.readImageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.readImageView];
        //阅读量数字
        self.readLable = [[UILabel alloc]initWithFrame:CGRectMake(self.readImageView.frame.origin.x + self.readImageView.frame.size.width + 2, self.readImageView.frame.origin.y, self.frame.size.width - self.readImageView.frame.origin.x - self.readImageView.frame.size.width - 2, self.readImageView.frame.size.height)];
        self.readLable.font = [UIFont systemFontOfSize:13];
        self.readLable.textColor = RGBA(94, 94, 94, 1);
        //self.readLable.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.readLable];
        //lable介绍
        self.introduceLable = [[UILabel alloc]initWithFrame:CGRectMake(25, self.readImageView.frame.origin.y + self.readImageView.frame.size.height, self.frame.size.width / 2 - 25, 200 - self.readImageView.frame.origin.y - self.readImageView.frame.size.height)];
        self.introduceLable.textAlignment = NSTextAlignmentLeft;
        
        self.introduceLable.numberOfLines = 0;
        self.introduceLable.font = [UIFont systemFontOfSize:13];
        self.introduceLable.textColor = RGBA(94, 94, 94, 1);
        //self.introduceLable.backgroundColor = [UIColor redColor];
        [self addSubview:self.introduceLable];
        //关注
        self.attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.attentionButton.frame = CGRectMake(self.readLable.frame.origin.x, self.readLable.frame.origin.y + self.readImageView.frame.size.height + 20, 85,31);
        //self.attentionButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.attentionButton];
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
