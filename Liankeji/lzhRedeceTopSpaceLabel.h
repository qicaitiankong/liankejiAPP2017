//
//  lzhRedeceTopSpaceLabel.h
//  Liankeji
//
//  Created by mac on 2017/2/11.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//首页中cell的标题label(实现字体上部间隙为零)
#import <UIKit/UIKit.h>
typedef enum
{
    VerticalAlignmentTop = 0, // default 字体与label上部对齐
    VerticalAlignmentMiddle,//
    VerticalAlignmentBottom,//下部对齐
} VerticalAlignment;

@interface lzhRedeceTopSpaceLabel : UILabel{
    @private
    VerticalAlignment _verticalAlignment;
}
@property (nonatomic) VerticalAlignment verticalAlignment;
@end
