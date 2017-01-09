//
//  userCommentParentView.m
//  Liankeji
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "userCommentParentView.h"
#import "appCommonAttributes.h"

@implementation userCommentParentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加遮罩
        UIButton *transparentButt = [UIButton buttonWithType:UIButtonTypeCustom];
        transparentButt.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        transparentButt.backgroundColor = [UIColor grayColor];
        transparentButt.alpha = 0.4;
         [transparentButt addTarget:self action:@selector(buttonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:transparentButt];
        //添加评论编辑框
        self.commentView = [[userWriteCommentView alloc]initWithFrame:CGRectMake(5, 200, SCREEN_WIDTH - 5 * 2, 300)];
        
        [self.commentView.cancelButton addTarget:self action:@selector(buttonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.commentView];
    }
    return self;
}
//背景与取消按钮点击事件
- (void)buttonClickHandler:(UIButton*)_b{
    [self.commentView.textView resignFirstResponder];
   // [self.commentView removeFromSuperview];
    [self removeFromSuperview];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
