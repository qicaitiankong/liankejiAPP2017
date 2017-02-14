//
//  userWriteCommentView.m
//  Liankeji
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "userWriteCommentView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation userWriteCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(239, 239, 239, 1);
        //取消按钮
        self.cancelButton.backgroundColor = [UIColor redColor];
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(5, 2, 50, 25);
        UIColor *cancelColor = RGBA(116, 116, 116, 1);
        [self.cancelButton setTitleColor:cancelColor forState:UIControlStateNormal];
        self.cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:self.cancelButton];
        [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(5);
            make.top.mas_equalTo(self).offset(2);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.1);
            make.height.mas_equalTo(self.cancelButton.mas_width).multipliedBy(0.5);
        }];
        
        //label
        UILabel *answerLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, 50, 25)];
        answerLabel.backgroundColor = [UIColor grayColor];
        answerLabel.center = CGPointMake(self.frame.size.width / 2, answerLabel.center.y);
        answerLabel.font = [UIFont systemFontOfSize:16];
        answerLabel.text = @"回复";
        answerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:answerLabel];
        [answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(2);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.15);
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(answerLabel.mas_width).multipliedBy(0.5);
        }];
        //发送按钮
        self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.sendButton.backgroundColor = [UIColor redColor];
        self.sendButton.frame = CGRectMake(self.frame.size.width - 5 - 50, 2, 50, 25);
        UIColor *sendButColor = RGBA(54, 127, 217, 1);
        [self.sendButton setTitleColor:sendButColor forState:UIControlStateNormal];
        self.sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [self addSubview:self.sendButton];
        
        [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.cancelButton.mas_width);
            make.height.mas_equalTo(self.cancelButton.mas_height);
            make.top.mas_equalTo(self.cancelButton);
            make.right.mas_equalTo(self).offset(-self.cancelButton.frame.origin.x);
        }];
        
        //文本编辑区
        self.textView = [[UITextView alloc]init];
        self.textView.frame = CGRectMake(self.cancelButton.frame.origin.x, self.cancelButton.frame.origin.y +self.cancelButton.frame.size.height + 10, self.frame.size.width - self.cancelButton.frame.origin.x * 2, self.frame.size.height - self.cancelButton.frame.origin.y - self.cancelButton.frame.size.height - 10 * 2);
        self.textView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textView];
        [self.textView becomeFirstResponder];
        
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.right.mas_equalTo(self);
            make.top.mas_equalTo(answerLabel.mas_bottom).offset(5);
            make.bottom.mas_equalTo(self).offset(-2);
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
