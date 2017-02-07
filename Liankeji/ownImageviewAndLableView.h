//
//  ownImageviewAndLableView.h
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
//资讯首页中cell中的关注量等加数字显示的分项view


@interface ownImageviewAndLableView : UIView

@property (strong,nonatomic)UIImageView *smallImageView;


@property (strong,nonatomic)UILabel *smallNumLable;

- (instancetype)initWithFrame:(CGRect)frame imageTag:(NSInteger)imageTag;
@end
