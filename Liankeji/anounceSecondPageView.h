//
//  anounceSecondPageView.h
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//发布的二级页面中第一个VIEW

#import <UIKit/UIKit.h>

@protocol announceSecondPageDelegate <NSObject>

- (void)returnHandler;

- (void)choosePhoto;

@end

@interface anounceSecondPageView : UIView
@property (strong,nonatomic)UIButton *ownButt;

@property (strong,nonatomic)UILabel *ownTitleLabel;

@property (strong,nonatomic)UIButton *photoButt;
//窗口上的baseView
@property (strong,nonatomic)UIView *baseView;

@property (assign,nonatomic)id<announceSecondPageDelegate> delegate;


- (instancetype)initWithFrame:(CGRect)frame delegate:(id<announceSecondPageDelegate>)delegate;

@end
