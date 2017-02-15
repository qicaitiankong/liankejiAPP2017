//
//  informationSecondPgeTavCell.m
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationSecondPgeTavCell.h"
#import <Masonry.h>

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
        [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(SCREEN_WIDTH * 0.013);
            make.top.mas_equalTo(self.contentView).offset(SCREEN_HEIGHT * 0.022);
            make.height.mas_equalTo(SCREEN_HEIGHT * 0.089);
            make.width.mas_equalTo(self.userImageView.mas_height);
            
        }];
        //名字
        self.userNameLable  = [[UILabel alloc]initWithFrame:CGRectMake(self.userImageView .frame.origin.x + self.userImageView.frame.size.width + 5, self.userImageView.frame.origin.y + 2, 200, 30)];
        self.userNameLable.textColor = RGBA(77, 149, 237, 1);
        self.userNameLable.font = [UIFont systemFontOfSize:15];
        //self.userNameLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userNameLable];
        
        [self.userNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userImageView.mas_right).offset(SCREEN_WIDTH * 0.029);
            make.top.mas_equalTo(self.userImageView.mas_top).offset(2);
            make.right.mas_equalTo(self.contentView.mas_centerX);
            make.height.mas_equalTo(self.userImageView.mas_height).multipliedBy(0.3);
        }];
        
        //
        self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(self.userNameLable.frame.origin.x, self.userNameLable.frame.origin.y + self.userNameLable.frame.size.height + 5,100, 10)];
        self.timeLable.font = [UIFont systemFontOfSize:12];
        self.timeLable.textColor = RGBA(163, 163, 163, 1);
        //self.timeLable.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.timeLable];
        
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userNameLable);
            make.width.mas_equalTo(self.userNameLable);
            make.top.mas_equalTo(self.userNameLable.mas_bottom).offset(self.userImageView.frame.size.height * 0.2);
            make.height.mas_equalTo(self.userNameLable);
            
        }];
        
        //
        self.commentLable = [[UILabel alloc]initWithFrame:CGRectMake(self.timeLable.frame.origin.x, self.timeLable.frame.origin.y + self.timeLable.frame.size.height + 5, _tableView.frame.size.width - self.timeLable.frame.origin.x - 5, 40)];
        self.commentLable.textColor = RGBA(64, 64, 64, 1);
        self.commentLable.font = [UIFont systemFontOfSize:15];
        self.commentLable.numberOfLines = 0;
        //self.commentLable.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.commentLable];
        [self.commentLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.timeLable);
            make.top.mas_equalTo(self.userImageView.mas_bottom);
            make.right.mas_equalTo(self.contentView.mas_right).offset(-SCREEN_WIDTH * 0.006);
            
        }];
        //
        self.givePraiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.givePraiseButton.backgroundColor = [UIColor greenColor];
        //self.givePraiseButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        //self.givePraiseButton.imageView.backgroundColor = [UIColor redColor];
        self.givePraiseButton.frame = CGRectMake(_tableView.frame.size.width - 100, self.userNameLable.frame.origin.y, 20, 20);
        [self.givePraiseButton setImage:[UIImage imageNamed:@"infoSecondPageNotGiveClick"] forState:UIControlStateNormal];
        [self.givePraiseButton addTarget:self action:@selector(givePraiseHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.givePraiseButton];
        
        [self.givePraiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_right).offset(-0.133 * SCREEN_WIDTH);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.046);
            make.top.mas_equalTo(self.userImageView.mas_top);
            make.height.mas_equalTo(self.givePraiseButton.mas_width);
            
        }];
        //
        self.givePraiseLable = [[UILabel alloc]initWithFrame:CGRectMake(self.givePraiseButton.frame.origin.x + self.givePraiseButton.frame.size.width + 5, self.givePraiseButton.frame.origin.y, 40, 15)];
        self.givePraiseLable.center = CGPointMake(self.givePraiseLable.center.x, self.givePraiseButton.center.y);
        self.givePraiseLable.font = [UIFont systemFontOfSize:12];
         self.commentLable.textColor = RGBA(163, 163, 163, 1);
        self.givePraiseLable.text = @"321";
        [self.contentView addSubview:self.givePraiseLable];
        
        [self.givePraiseLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.givePraiseButton.mas_right).offset(0.02 * SCREEN_WIDTH);
            make.right.mas_equalTo(self.contentView.mas_right).offset(-2);
            make.height.mas_equalTo(self.givePraiseButton);
            make.centerY.mas_equalTo(self.givePraiseButton.mas_centerY);
            
        }];
        
    }
    return self;
}
- (void)givePraiseHandler:(UIButton*)_b{
    self.praised = !self.praised;
     NSInteger readNum = [self.givePraiseLable.text integerValue];
    if(self.praised){
        [_b setImage:[UIImage imageNamed:@"infoSecondPageGivedClick"] forState:UIControlStateNormal];
        readNum  = readNum + 1;
    }else{
         [self.givePraiseButton setImage:[UIImage imageNamed:@"infoSecondPageNotGiveClick"] forState:UIControlStateNormal];
        readNum = readNum - 1;
    }
    self.givePraiseLable.text = [NSString stringWithFormat:@"%li",readNum];

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
