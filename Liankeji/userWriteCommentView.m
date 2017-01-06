//
//  userWriteCommentView.m
//  Liankeji
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "userWriteCommentView.h"
#import "appCommonAttributes.h"



@implementation userWriteCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(239, 239, 239, 1);
        //取消按钮
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(5, 2, 50, 25);
        UIColor *cancelColor = RGBA(116, 116, 116, 1);
        [self.cancelButton setTitleColor:cancelColor forState:UIControlStateNormal];
        self.cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:self.cancelButton];
        //label
        UILabel *answerLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, 50, 25)];
        answerLabel.center = CGPointMake(self.frame.size.width / 2, answerLabel.center.y);
        answerLabel.font = [UIFont systemFontOfSize:16];
        answerLabel.text = @"回复";
        [self addSubview:answerLabel];
        //发送按钮
        self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.sendButton.backgroundColor = [UIColor redColor];
        self.sendButton.frame = CGRectMake(self.frame.size.width - 5 - 50, 2, 50, 25);
        UIColor *sendButColor = RGBA(54, 127, 217, 1);
        [self.sendButton setTitleColor:sendButColor forState:UIControlStateNormal];
        self.sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [self addSubview:self.sendButton];
        //文本编辑区
        self.textView = [[UITextView alloc]init];
        self.textView.frame = CGRectMake(self.cancelButton.frame.origin.x, self.cancelButton.frame.origin.y +self.cancelButton.frame.size.height + 10, self.frame.size.width - self.cancelButton.frame.origin.x * 2, self.frame.size.height - self.cancelButton.frame.origin.y - self.cancelButton.frame.size.height - 10 * 2);
        self.textView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textView];
        [self.textView becomeFirstResponder];
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
