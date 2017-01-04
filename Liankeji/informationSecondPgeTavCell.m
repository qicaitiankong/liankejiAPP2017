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
        //间隙
        self.spaceLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 20)];
        self.spaceLineView.backgroundColor = RGBA(246, 246, 246, 1);
        [self.contentView addSubview:self.spaceLineView];
        //用户头像
        self.userImageView = [[UIImageView alloc]init];
        self.userImageView .frame = CGRectMake(5, self.spaceLineView.frame.origin.y + self.spaceLineView.frame.size.height + 9, 60, 60);
        self.userImageView .layer.cornerRadius = self.userImageView .frame.size.width / 2;
        //self.userImageView .backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userImageView ];
        //名字
        self.userNameLable  = [[UILabel alloc]initWithFrame:CGRectMake(self.userImageView .frame.origin.x + self.userImageView.frame.size.width + 5, self.userImageView.frame.origin.y + self.userImageView.frame.size.height / 2, 200, 40)];
        self.userNameLable.textColor = RGBA(46, 46, 46, 1);
        self.userNameLable.font = [UIFont systemFontOfSize:15];
        //self.userNameLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userNameLable];
        //阅读量图片
        self.readImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_tableView.frame.size.width / 2 + 30, self.userImageView.frame.origin.y + self.userImageView.frame.size.height, 19, 18)];
        //self.readImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.readImageView];
        //阅读量数字
        self.readLable = [[UILabel alloc]initWithFrame:CGRectMake(self.readImageView.frame.origin.x + self.readImageView.frame.size.width + 2, self.readImageView.frame.origin.y, _tableView.bounds.size.width - self.readImageView.frame.origin.x - self.readImageView.frame.size.width - 2, self.readImageView.frame.size.height)];
        self.readLable.font = [UIFont systemFontOfSize:13];
        self.readLable.textColor = RGBA(94, 94, 94, 1);
        //self.readLable.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.readLable];
        //lable介绍
        self.introduceLable = [[UILabel alloc]initWithFrame:CGRectMake(25, self.readImageView.frame.origin.y + self.readImageView.frame.size.height, _tableView.frame.size.width / 2 - 25, 200 - self.readImageView.frame.origin.y - self.readImageView.frame.size.height)];
        self.introduceLable.textAlignment = NSTextAlignmentLeft;
        self.introduceLable.numberOfLines = 0;
        self.introduceLable.font = [UIFont systemFontOfSize:13];
        self.introduceLable.textColor = RGBA(94, 94, 94, 1);
        self.introduceLable.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.introduceLable];
        //关注
        self.attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.attentionButton.frame = CGRectMake(self.readLable.frame.origin.x, self.readLable.frame.origin.y + self.readImageView.frame.size.height + 20, 85,31);
        //self.attentionButton.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.attentionButton];
        
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
