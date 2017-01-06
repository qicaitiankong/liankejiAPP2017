//
//  commentView.m
//  Liankeji
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "commentView.h"

@implementation commentView
@synthesize transParentButt;
@synthesize givePraiseButton;


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //创建矩形VIEW
        UIView *textView = [[UIView alloc]initWithFrame:CGRectMake(2, 4, self.frame.size.width * 0.6, self.frame.size.height - 2 * 4)];
        textView.layer.borderWidth = 1;
        textView.layer.borderColor = [UIColor grayColor].CGColor;
        textView.layer.cornerRadius = 8;
        textView.backgroundColor = [UIColor whiteColor];
        [self addSubview:textView];
        //添加图片
        UIImageView *textImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 2, 17, 17)];
        [textImageView setImage:[UIImage imageNamed:@"infoSecondPageComment"]];
        textImageView.center = CGPointMake(textImageView.center.x, textView.frame.size.height / 2);
        [self addSubview:textImageView];
        //label
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(textImageView.frame.origin.x + textImageView.frame.size.width + 10, 2, 80, 20)];
        textLabel.center = CGPointMake(textLabel.center.x, textImageView.center.y);
        textLabel.textColor = RGBA(163, 163, 163, 1);
        textLabel.font = [UIFont systemFontOfSize:12];
        textLabel.text = @"评论区";
        [self addSubview:textLabel];
        //遮罩按钮
        transParentButt = [UIButton buttonWithType:UIButtonTypeCustom];
        transParentButt.frame = CGRectMake(0, 0, textView.frame.size.width, textView.frame.size.height);
        transParentButt.backgroundColor = [UIColor clearColor];
        transParentButt.layer.cornerRadius = textView.layer.cornerRadius;
        //[transParentButt addTarget:self action:@selector(commentHandler:) forControlEvents:UIControlEventTouchUpInside];
        [textView addSubview:transParentButt];
        //打赏
        givePraiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //打赏按钮5：2
        givePraiseButton.frame = CGRectMake(textView.frame.origin.x + textView.frame.size.width + 20,textView.frame.origin.y , 100, 40);
        [givePraiseButton setImage:[UIImage imageNamed:@"infoSecondPageReward"] forState:UIControlStateNormal];
        givePraiseButton.center = CGPointMake(givePraiseButton.center.x, textView.center.y);
        [self addSubview:givePraiseButton];
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
