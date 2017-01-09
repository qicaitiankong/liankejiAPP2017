//
//  ownTextSpace.h
//  Liankeji
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

//用于设置文字行间距

@interface ownTextSpace :NSObject
//字符串，样板label 行间距
+ (void)setTextSpace:(NSString *)textString targetLable:(UILabel*)textLable textSpace:(CGFloat)spaceSize;
@end
