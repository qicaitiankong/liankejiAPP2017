//
//  informationSecondPgeTavCell.h
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.

//评论的CELL
#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"
@interface informationSecondPgeTavCell : UITableViewCell
//上面的间隙
@property (strong,nonatomic)UIView *spaceLineView;
//用户头像
@property (strong,nonatomic) UIImageView *userImageView;
//点赞按钮
@property (strong,nonatomic) UIButton *givePraiseButton;
//用户名字
@property (strong,nonatomic) UILabel *userNameLable;
//时间
@property (strong,nonatomic) UILabel *timeLable;
//点赞量
@property (strong,nonatomic) UILabel *givePraiseLable;
//是否已经点赞
@property (assign ,nonatomic)BOOL praised;
//评论
@property (strong,nonatomic) UILabel *commentLable;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView;

@end
