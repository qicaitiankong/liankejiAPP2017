//
//  PersonalTableViewCell.h
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//第一页第二种cell

#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"
#import <Masonry.h>
@interface PersonalTableViewCell : UITableViewCell

@property (strong,nonatomic)UIImageView *firstImageView;

@property (strong,nonatomic)UILabel *secondTitleLable;

@property (strong,nonatomic) UILabel *flagGoLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier _tableview:(UITableView*)_tableView;

@end
