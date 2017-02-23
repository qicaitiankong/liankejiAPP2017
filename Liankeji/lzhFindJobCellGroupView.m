//
//  lzhFindJobCellGroupView.m
//  suipianTest
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "lzhFindJobCellGroupView.h"

@implementation lzhFindJobCellGroupView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        UIImage *myImage = nil;
        for(NSInteger i = 0; i < 3; i ++){
            BOOL issecond = NO;
            if(i == 1){
                issecond = YES;
            }
            lzhFindJobCellSmallView *smallView = [[lzhFindJobCellSmallView alloc]initWithFrame:CGRectMake(i *self.frame.size.width * 0.33, 0, self.frame.size.width * 0.33, self.frame.size.height) isSecond:issecond];
            if(i == 0){
                myImage = [UIImage imageNamed:@"findFirstPageLocation@3x"];
                self.firstLabel = smallView.secondTitleLabel;
            }else{
                if(i == 1){
                    myImage = [UIImage imageNamed:@"findFirstPageAcademic@3x"];
                    self.secondLabel = smallView.secondTitleLabel;
                }else{
                    myImage = [UIImage imageNamed:@"findFirstPageExperience@3x"];
                    self.thirdLabel = smallView.secondTitleLabel;
                }
            }
             [smallView.firstImageView setImage:myImage];
            [self addSubview:smallView];
        }
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
