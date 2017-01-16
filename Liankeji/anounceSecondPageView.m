//
//  anounceSecondPageView.m
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "anounceSecondPageView.h"
#import "lzhReturnView.h"
#import "appCommonAttributes.h"
#import "announSecondPageSelectView.h"
#import "announceSecondPageNextStepButt.h"
#import "announSecondPageNextStepView.h"

@interface anounceSecondPageView ()<UITextFieldDelegate>

@end

@implementation anounceSecondPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //添加上部返回view
        lzhReturnView *returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.frame.size.width, 40)];
        self.ownButt = returnView.ownButt;
        self.ownTitleLabel = returnView.ownTitleLabel;
        [self.ownButt setTitle:@"返回" forState:UIControlStateNormal];
        returnView.backgroundColor = [UIColor redColor];
        [self addSubview:returnView];
        //上传图片按钮
        UIButton *photoButt = [UIButton buttonWithType:UIButtonTypeCustom];
        photoButt.frame = CGRectMake(5, returnView.frame.origin.y + returnView.frame.size.height + 20, 100, 100);
        photoButt.center = CGPointMake(self.frame.size.width / 2,photoButt.center.y);
        //photoButt.backgroundColor = [UIColor grayColor];
        [photoButt setImage:[UIImage imageNamed:@"anounSecondPhotoButt"] forState:UIControlStateNormal];
        [photoButt addTarget:self action:@selector(uploadPhoto) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:photoButt];
        //输入技术名称
        UILabel *technologyNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, photoButt.frame.origin.y + photoButt.frame.size.height + 30, 100, 30)];
        technologyNameLabel.textColor = [UIColor blackColor];
        technologyNameLabel.text = @"技术名称：";
        [technologyNameLabel sizeToFit];
        [self addSubview:technologyNameLabel];
        //输入框
        UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(technologyNameLabel.frame.origin.x + technologyNameLabel.frame.size.width, technologyNameLabel.frame.origin.y, self.frame.size.width - technologyNameLabel.frame.origin.x - technologyNameLabel.frame.size.width - 30, 40)];
        nameField.center = CGPointMake(nameField.center.x,technologyNameLabel.center.y);
        nameField.returnKeyType = UIReturnKeyDone;
        nameField.backgroundColor = [UIColor whiteColor];
        nameField.layer.borderWidth = 2;
        nameField.layer.borderColor = [UIColor grayColor].CGColor;
        nameField.delegate = self;
        [self addSubview:nameField];
        //技术方向
        UILabel *technologeDirectionLabe = [[UILabel alloc]initWithFrame:CGRectMake(technologyNameLabel.frame.origin.x, nameField.frame.origin.y + nameField.frame.size.height + 20, technologyNameLabel.frame.size.width, technologyNameLabel.frame.size.height)];
        technologeDirectionLabe.font = technologyNameLabel.font;
        technologeDirectionLabe.text = @"技术方向：";
        [self addSubview:technologeDirectionLabe];
        for (NSInteger i = 0; i < 12; i ++){
            announSecondPageSelectView *selectView = [[announSecondPageSelectView alloc]initWithFrame:CGRectMake(technologeDirectionLabe.frame.origin.x + technologeDirectionLabe.frame.size.width + (i % 3) * 80, technologeDirectionLabe.frame.origin.y + i / 3 * 30, 80, 30)];
            selectView.ownContentLabe.text = @"技术方向";
            [self addSubview:selectView];
        }
        //技术投资
        UILabel *technologeInvesmentLabe = [[UILabel alloc]initWithFrame:CGRectMake(technologeDirectionLabe.frame.origin.x, technologeDirectionLabe.frame.origin.y + 30 + 12 / 3 * 30, technologeDirectionLabe.frame.size.width, technologeDirectionLabe.frame.size.height)];
        technologeInvesmentLabe.font = technologeDirectionLabe.font;
        technologeInvesmentLabe.text = @"技术投资：";
        [self addSubview:technologeInvesmentLabe];
        for (NSInteger i = 0; i < 6; i ++){
            announSecondPageSelectView *selectView = [[announSecondPageSelectView alloc]initWithFrame:CGRectMake(technologeInvesmentLabe.frame.origin.x + technologeInvesmentLabe.frame.size.width + (i % 3) * 80, technologeInvesmentLabe.frame.origin.y + i / 3 * 30, 80, 30)];
            selectView.ownContentLabe.text = @"技术投资";
            [self addSubview:selectView];
        }
        //上一步按钮
        announceSecondPageNextStepButt *buttView = [[announceSecondPageNextStepButt alloc]initWithFrame:CGRectMake(technologeInvesmentLabe.frame.origin.x,self.frame.size.height - 100 , self.frame.size.width -  2 * technologeInvesmentLabe.frame.origin.x, 40)];
        buttView.previousButt.userInteractionEnabled = NO;
        [buttView.nextButt setBackgroundImage:[UIImage imageNamed:@"nextButton"] forState:UIControlStateNormal];
        [buttView.nextButt addTarget:self action:@selector(nextStepHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttView];
        
    }
    return self;
}
//上传图片
- (void)uploadPhoto{
    NSLog(@"上传图片");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)nextStepHandler:(UIButton*)_b{
    NSLog(@"下一步");
    announSecondPageNextStepView *nextView = [[announSecondPageNextStepView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    UIWindow *window = APP_MAIN_WINDOW;
    [window addSubview:nextView];
    
    [UIView animateWithDuration:1 animations:^{
        nextView.transform = CGAffineTransformMakeTranslation(-SCREEN_WIDTH, 0);
    } completion:^(BOOL finished) {
        
    }];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
