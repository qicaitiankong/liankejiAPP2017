//
//  informationSecondPgeTavCell.m
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationSecondPgeTavCell.h"

@implementation informationSecondPgeTavCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.userImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.userImageButton.frame = CGRectMake(5, 9, 100, 100);
        self.userImageButton.backgroundColor = [UIColor grayColor];
        self.userImageButton.userInteractionEnabled = NO;
        [self.contentView addSubview:self.userImageButton];
        
        self.userNameLable = [[UILabel alloc]initWithFrame:CGRectMake(self.userImageButton.frame.origin.x + self.userImageButton.frame.size.width + 5, 30, 200, 40)];
        self.userNameLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userNameLable];
        
        
        self.introduceLable = [[UILabel alloc]initWithFrame:CGRectMake(25, self.userImageButton.frame.origin.y + self.userImageButton.frame.size.height  + 10, self.frame.size.width / 2 - 2 * 25, 400 - self.userImageButton.frame.origin.y - self.userImageButton.frame.size.height - 20)];
        self.introduceLable.numberOfLines = 0;
        self.introduceLable.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.introduceLable];
        
        
        self.readImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width / 2, self.userImageButton.frame.origin.y + self.userImageButton.frame.size.height, 30, 20)];
        self.readImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.readImageView];
        
        
        self.readLable = [[UILabel alloc]initWithFrame:CGRectMake(self.readImageView.frame.origin.x + self.readImageView.frame.size.width, self.readImageView.frame.origin.y, self.frame.size.width / 2 - self.readImageView.frame.size.width, self.readImageView.frame.size.height)];
        self.readLable.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.readLable];
        
        self.attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.attentionButton.frame = CGRectMake(self.introduceLable.frame.origin.x + self.introduceLable.frame.size.width + 60, self.readLable.frame.origin.y + self.readImageView.frame.size.height + 70, 100, 50);
        self.attentionButton.backgroundColor = [UIColor redColor];
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
