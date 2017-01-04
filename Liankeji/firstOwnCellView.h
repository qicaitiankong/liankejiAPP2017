//
//  firstOwnCellView.h
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"
//最上面第一个view


@interface firstOwnCellView : UIView

@property (strong,nonatomic)UIImageView *ownImageView;

@property (strong,nonatomic)UILabel *ownFirstTitleLable;

@property (strong,nonatomic) UILabel *ownAuthorLable;

- (instancetype)initWithFrame:(CGRect)frame titleString:(NSString *)titleStr;


@end
