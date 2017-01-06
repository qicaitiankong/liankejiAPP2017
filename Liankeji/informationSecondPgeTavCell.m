//
//  informationSecondPgeTavCell.m
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationSecondPgeTavCell.h"

@implementation informationSecondPgeTavCell

//布局顺序：间隙-》头像-》名字->阅读量图片->阅读量->介绍->关注

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = [UIColor whiteColor];
        //间隙 2
        self.spaceLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 2)];
        self.spaceLineView.backgroundColor = RGBA(246, 246, 246, 1);
        [self.contentView addSubview:self.spaceLineView];
        //用户头像 60
        self.userImageView = [[UIImageView alloc]init];
        self.userImageView .frame = CGRectMake(5, self.spaceLineView.frame.origin.y + self.spaceLineView.frame.size.height + 9, 60, 60);
        self.userImageView .layer.cornerRadius = self.userImageView .frame.size.width / 2;
        //self.userImageView .backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userImageView ];
        //名字
        self.userNameLable  = [[UILabel alloc]initWithFrame:CGRectMake(self.userImageView .frame.origin.x + self.userImageView.frame.size.width + 5, self.userImageView.frame.origin.y + 2, 200, 30)];
        self.userNameLable.textColor = RGBA(77, 149, 237, 1);
        self.userNameLable.font = [UIFont systemFontOfSize:15];
        //self.userNameLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userNameLable];
        
        
        self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(self.userNameLable.frame.origin.x, self.userNameLable.frame.origin.y + self.userNameLable.frame.size.height + 5,100, 10)];
        self.timeLable.font = [UIFont systemFontOfSize:12];
        self.timeLable.textColor = RGBA(163, 163, 163, 1);
        //self.timeLable.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.timeLable];
        //40
        self.commentLable = [[UILabel alloc]initWithFrame:CGRectMake(self.timeLable.frame.origin.x, self.timeLable.frame.origin.y + self.timeLable.frame.size.height + 5, _tableView.frame.size.width - self.timeLable.frame.origin.x - 5, 40)];
        self.commentLable.textColor = RGBA(64, 64, 64, 1);
        self.commentLable.font = [UIFont systemFontOfSize:15];
        self.commentLable.numberOfLines = 0;
        //self.commentLable.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.commentLable];
        
        self.givePraiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.givePraiseButton.backgroundColor = [UIColor greenColor];
        self.givePraiseButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        //self.givePraiseButton.imageView.backgroundColor = [UIColor redColor];
        self.givePraiseButton.frame = CGRectMake(_tableView.frame.size.width - 100, self.userNameLable.frame.origin.y, 20, 20);
        [self.givePraiseButton setImage:[UIImage imageNamed:@"infoSecondPageNotGiveClick"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.givePraiseButton];
        
        self.givePraiseLable = [[UILabel alloc]initWithFrame:CGRectMake(self.givePraiseButton.frame.origin.x + self.givePraiseButton.frame.size.width + 5, self.givePraiseButton.frame.origin.y, 40, 15)];
        self.givePraiseLable.center = CGPointMake(self.givePraiseLable.center.x, self.givePraiseButton.center.y);
        self.givePraiseLable.font = [UIFont systemFontOfSize:12];
         self.commentLable.textColor = RGBA(163, 163, 163, 1);
        self.givePraiseLable.text = @"321";
        [self.contentView addSubview:self.givePraiseLable];
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
