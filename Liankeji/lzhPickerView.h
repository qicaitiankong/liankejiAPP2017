//
//  lzhPickerView.h
//  Liankeji
//
//  Created by mac on 2017/2/13.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pickerCompannyDelegate <NSObject>

- (void)getPickerInfomation:(NSString*)selectInfomation buttonTag:(NSInteger)tag;

@end

@interface lzhPickerView : UIView

@property (assign,nonatomic)id<pickerCompannyDelegate> targetDelegate;

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray*)titleArr;

@end
