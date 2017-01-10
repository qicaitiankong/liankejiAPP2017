//
//  exchangeView1.h
//  Liankeji
//
//  Created by mac on 2017/1/10.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//转场view1

#import <UIKit/UIKit.h>

@protocol owntouchDelegate <NSObject>

- (void)exchangeViewHandler:(UIView*)firstView;

@end

@interface exchangeView1 : UIView

@property (strong,nonatomic)UIImageView *ownImageView;

@property (assign,nonatomic)id<owntouchDelegate> ownDelegate;

@end
