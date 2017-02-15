//
//  informationTableViewCell.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.

//资讯的首页的自定义CELL

#import <UIKit/UIKit.h>
#import "lzhRedeceTopSpaceLabel.h"
#import "ownImageviewAndLableView.h"
#import "infomaFirstPageViewForCell.h"


@interface informationTableViewCell : UITableViewCell

@property (strong,nonatomic)UIImageView *ownImageView;

@property (strong,nonatomic)lzhRedeceTopSpaceLabel *firstLable;

@property (strong,nonatomic)UILabel *secondLable;

@property (strong,nonatomic) ownImageviewAndLableView *firstSmallDisplayView;

@property (strong,nonatomic) ownImageviewAndLableView *secondSmallDisplayView;

@property (strong,nonatomic) ownImageviewAndLableView *thirdSmallDisplayView;

@property (strong,nonatomic) infomaFirstPageViewForCell *groupView;

//@property (strong,nonnull)NSString *firstSmallNumberString;
//
//
//@property (strong,nonnull)NSString *secondSmallNumberString;
//
//
//@property (strong,nonnull)NSString *thirdSmallNumberString;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView;

@end
