//
//  informationSecondPgeTavCell.h
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface informationSecondPgeTavCell : UITableViewCell

@property (strong,nonatomic) UIButton *userImageButton;

@property (strong,nonatomic) UIButton *attentionButton;

@property (strong,nonatomic) UILabel *userNameLable;

@property (strong,nonatomic) UILabel *introduceLable;

@property (strong,nonatomic) UIImageView *readImageView;

@property (strong,nonatomic) UILabel *readLable;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView;

@end
