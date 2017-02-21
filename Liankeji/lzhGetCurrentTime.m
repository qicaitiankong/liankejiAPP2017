//
//  lzhGetCurrentTime.m
//  Liankeji
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhGetCurrentTime.h"

@implementation lzhGetCurrentTime
//
+ (NSString*)getCurrentTime{
    lzhGetCurrentTime *timeClass = [[lzhGetCurrentTime alloc]init];
     NSString *timeStr = nil;
    if(timeClass){
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM--dd"];
        timeStr = [formatter stringFromDate:date];
    }
    return timeStr;
}

@end
