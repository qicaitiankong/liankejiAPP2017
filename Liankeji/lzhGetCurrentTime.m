//
//  lzhGetCurrentTime.m
//  Liankeji
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhGetCurrentTime.h"
#import <NSDate+Category.h>

@implementation lzhGetCurrentTime
//待实现
+ (NSString*)getCurrentTime{
    lzhGetCurrentTime *timeClass = [[lzhGetCurrentTime alloc]init];
     NSString *timeStr = nil;
    if(timeClass){
        NSDate *senddate=[NSDate date];
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSInteger interval = [zone secondsFromGMTForDate: senddate];
        NSDate *localDate = [senddate dateByAddingTimeInterval: interval];
        
        
        
//      NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        //[formatter setDateStyle:NSDateFormatterMediumStyle];
//        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
        [formatter setDateFormat:@"YYYY-MM-DD"];
      timeStr = [formatter stringFromDate:localDate];
        
    }
    return timeStr;
}

@end
