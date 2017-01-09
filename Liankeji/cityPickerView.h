//
//  cityPickerView.h
//  Liankeji
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressPickerView.h"
#import "cityPickerDelegate.h"

@interface cityPickerView : UIView<AddressPickerViewDelegate>

@property (assign,nonatomic)id<cityPickerDelegate> ownCityDelegate;

@end
