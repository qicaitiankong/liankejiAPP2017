//
//  lzhFindJobCell.h
//  suipianTest
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lzhFindJobCell : UITableViewCell
//头像
@property (strong,nonatomic)UIImageView *personImageView;
//名字
@property (strong,nonatomic)UILabel *personNameLabel;
//职位
@property (strong,nonatomic)UILabel *personJobLabel;
//薪资
@property(strong,nonatomic)UILabel *personSalaryLabel;
//定位
@property(strong,nonatomic)UILabel *locationLabel;
//学历
@property(strong,nonatomic)UILabel *academicLabel;
//经验
@property(strong,nonatomic)UILabel *experienceLabel;
//tableView:被加到的表视图
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetTableView:(UITableView*)tableView;

@end
