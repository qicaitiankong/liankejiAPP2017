//
//  userWriteCommentView.h
//  Liankeji
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
//用户写评论的view

@interface userWriteCommentView : UIView
//取消按钮
@property (strong,nonatomic)UIButton *cancelButton;
//发送按钮
@property (strong,nonatomic)UIButton *sendButton;
//文本编辑区
@property (strong,nonatomic)UITextView *textView;

@end
