//
//  ownTextSpace.m
//  Liankeji
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ownTextSpace.h"

@implementation ownTextSpace

+ (void)setTextSpace:(NSString *)textString targetLable:(UILabel*)textLable textSpace:(CGFloat)spaceSize{
    // 调整行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spaceSize];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [textString length])];
    textLable.attributedText = attributedString;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
