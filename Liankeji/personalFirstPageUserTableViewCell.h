//
//  personalFirstPageUserTableViewCell.h
//  Liankeji
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//第一种cell

#import <UIKit/UIKit.h>

@interface personalFirstPageUserTableViewCell : UITableViewCell

@property (strong,nonatomic)UIImageView *userImageView;

@property (strong,nonatomic)UILabel *userNameLabel;

@property (strong,nonatomic) UILabel *jobLabel;

@property (strong,nonatomic) UIImageView *memberImageView;

@property (strong,nonatomic) UILabel *memberNameLabel;

@property (strong,nonatomic) UILabel *goLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier _tableview:(UITableView*)_tableView;

@end
