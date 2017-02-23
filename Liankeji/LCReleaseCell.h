//
//  LCReleaseCell.h
//  Liankeji
//
//  Created by liuchen on 2017/2/22.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCReleaseCell : UITableViewCell

//可滑动的ScrollView
@property (nonatomic,strong) UIScrollView *picScrollView;
//用以接受数据的字典
@property (nonatomic,strong) NSDictionary *releaseDic;

@end
