//
//  personalFirstPageUserTableViewCell.m
//  Liankeji
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "personalFirstPageUserTableViewCell.h"
#import "appCommonAttributes.h"
//行高
#define ROW_HEIGHT 80

@implementation personalFirstPageUserTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier _tableview:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        self.userImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 60)];
        self.userImageView.center = CGPointMake(self.userImageView.center.x, ROW_HEIGHT / 2);
        self.userImageView.layer.cornerRadius = 5;
        self.userImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userImageView];
        //
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.userImageView.frame.origin.x + self.userImageView.frame.size.width + 10, self.userImageView.frame.origin.y + 5, 80, 20)];
        //self.userNameLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.userNameLabel];
        //
        self.jobLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.userNameLabel.frame.origin.x, self.userImageView.frame.origin.y + self.userNameLabel.frame.size.height + 15, 80, 20)];
        //self.jobLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.jobLabel];
        //
        self.memberImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_tableView.frame.size.width / 2 + 30, 5, 25, 25)];
        self.memberImageView.center = CGPointMake(self.memberImageView.center.x, ROW_HEIGHT / 2);
        //self.memberImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.memberImageView];
        //
        self.memberNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.memberImageView.frame.origin.x + self.memberImageView.frame.size.width + 5, self.memberImageView.frame.origin.y + 3, 60, self.memberImageView.frame.size.height - 3)];
        self.memberNameLabel.font = [UIFont systemFontOfSize:13];
        //self.memberNameLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.memberNameLabel];
        //
        self.goLabel= [[UILabel alloc]initWithFrame:CGRectMake(_tableView.frame.size.width - 30, self.memberImageView.frame.origin.y, 30, 20)];
        self.goLabel.text = @">";
        //self.goLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.goLabel];
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
