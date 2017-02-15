//
//  BasicViewControllerForAddReturnview.h
//  Liankeji
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//用于其他控制器继承

#import <UIKit/UIKit.h>
#import "lzhReturnView.h"

@interface BasicViewControllerForAddReturnview : UIViewController
//添加上部自定义返回VIEW
@property (strong,nonatomic) lzhReturnView *returnView;

@end
