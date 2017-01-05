//
//  informationTableViewCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationTableViewCell.h"
#import"appCommonAttributes.h"
#import "ownImageviewAndLableView.h"

@interface informationTableViewCell(){
    ownImageviewAndLableView *firstSmallDisplayView;
    ownImageviewAndLableView *secondSmallDisplayView;
    ownImageviewAndLableView *thirdSmallDisplayView;

}
@end


@implementation informationTableViewCell
@synthesize ownImageView;
@synthesize firstLable;
@synthesize secondLable;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //NSLog(@"selfheight=%lf,contentviewheight=%lf,selfWidth=%lf,contentViewWidth=%lf,tableViewWidth=%lf",self.frame.size.height,self.contentView.frame.size.height,self.frame.size.width,self.contentView.frame.size.width,_tableView.frame.size.width);
        
        
        CGFloat ImageViewSpace = 5;
        //行高按100先设置的
        //NSLog(@"inittableview = %lf",);
        CGFloat imageViewHeight = 100 - ImageViewSpace * 2;
        CGFloat imageViewWidth = imageViewHeight;
        
        //lable上下之间的间距
        CGFloat lableSpace = 2;
        
        CGFloat lableWidth = _tableView.frame.size.width - imageViewWidth - 3 * ImageViewSpace;
        
        CGFloat lableHeight = (imageViewHeight - lableSpace * 4) / 3;
        //cell中左边图片
        ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ImageViewSpace, ImageViewSpace, imageViewWidth, imageViewHeight)];
        ownImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:ownImageView];
        //首标题LABLE
        firstLable = [[UILabel alloc]initWithFrame:CGRectMake(ownImageView.frame.origin.x + ownImageView.bounds.size.width + ImageViewSpace, ownImageView.frame.origin.y, lableWidth, lableHeight)];
        //firstLable.backgroundColor = [UIColor grayColor];
        firstLable.textColor = RGBA(87, 86, 86, 1);
        firstLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:firstLable];
        
        //紧靠图片右边的种类lable
        CGFloat secondLableWidth = 40;
        CGFloat secondLableHeight = 30;
        
        secondLable = [[UILabel alloc]initWithFrame:CGRectMake(firstLable.frame.origin.x, ownImageView.frame.origin.y + ownImageView.frame.size.height - secondLableHeight, secondLableWidth,secondLableHeight)];
        
        //secondLable.backgroundColor = [UIColor blueColor];
        secondLable.textColor = RGBA(167, 167, 167, 1);
        secondLable.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:secondLable];
        //第一个小view浏览量
        firstSmallDisplayView = [[ownImageviewAndLableView alloc]initWithFrame:CGRectMake(secondLable.frame.origin.x + secondLable.frame.size.width + 10, secondLable.frame.origin.y, 80, 40) imageTag:1];
        
        UIImage *firstImage = [UIImage imageNamed:@"informationSkim"];
        [firstSmallDisplayView.smallImageView setImage:firstImage];
        firstSmallDisplayView.smallNumLable.text = self.firstSmallNumberString;
        [self.contentView addSubview:firstSmallDisplayView];
        
        //评论量view
        secondSmallDisplayView = [[ownImageviewAndLableView alloc]initWithFrame:CGRectMake(firstSmallDisplayView.frame.origin.x + firstSmallDisplayView.frame.size.width, firstSmallDisplayView.frame.origin.y, 80, 40) imageTag:2];
        
        UIImage *secondImage = [UIImage imageNamed:@"informationComment"];
    
        
        [secondSmallDisplayView.smallImageView setImage:secondImage];
        secondSmallDisplayView.smallNumLable.text = self.secondSmallNumberString;
        [self.contentView addSubview:secondSmallDisplayView];

        //悬赏view
        thirdSmallDisplayView = [[ownImageviewAndLableView alloc]initWithFrame:CGRectMake(secondSmallDisplayView.frame.origin.x + secondSmallDisplayView.frame.size.width, secondSmallDisplayView.frame.origin.y, 80, 40) imageTag:3];
        
        UIImage *thirdImage = [UIImage imageNamed:@"informationReward"];
        //NSLog(@"imageWidth = %lf:%lf",thirdImage.size.width,thirdImage.size.height);
        [thirdSmallDisplayView.smallImageView setImage:thirdImage];
        
        thirdSmallDisplayView.smallNumLable.text = self.thirdSmallNumberString;
        [self.contentView addSubview:thirdSmallDisplayView];

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //赋值
    firstSmallDisplayView.smallNumLable.text = self.firstSmallNumberString;
    secondSmallDisplayView.smallNumLable.text = self.secondSmallNumberString;
    thirdSmallDisplayView.smallNumLable.text = self.thirdSmallNumberString;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
