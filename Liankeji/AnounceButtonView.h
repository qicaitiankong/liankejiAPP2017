//
//  AnounceButtonView.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol announceButtonClickDelegate <NSObject>

- (void)announceButtonClick:(NSInteger)index;

@end

@interface AnounceButtonView : UIView

@property (strong,nonatomic)UIImageView *ownImageView;

@property (strong,nonatomic)UILabel *ownLable;

@property (strong,nonatomic)UIButton *imageButton;

@property (strong,nonatomic)UIButton *titleButton;

@property (assign,nonatomic)id <announceButtonClickDelegate>
    announceDelegate;
//frame ,代理,标签，图片占得比例
-(instancetype)initWithFrame:(CGRect)frame delegate:(id<announceButtonClickDelegate>)_delegate buttonTag:(NSInteger)buttonTag imageViewPropertion:(CGFloat)imageViewPropertion ;

@end
