//
//  cityPickerDelegate.h
//  Liankeji
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#ifndef cityPickerDelegate_h
#define cityPickerDelegate_h

#import <Foundation/Foundation.h>

@protocol cityPickerDelegate<NSObject>

- (void)getCityInformation:(NSString*)_province  city:(NSString*)_city area:(NSString*)_area;

@end


#endif /* cityPickerDelegate_h */
