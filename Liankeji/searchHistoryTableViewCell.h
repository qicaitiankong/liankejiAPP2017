//
//  searchHistoryTableViewCell.h
//  Liankeji
//
//  Created by mac on 2017/2/17.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchHistoryTableViewCell : UITableViewCell

@property (strong,nonatomic)UILabel *historyLabel;

@property (strong,nonatomic) UIButton *cancelButt;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)tableView;


@end
