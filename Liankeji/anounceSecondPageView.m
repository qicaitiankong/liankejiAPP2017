//
//  anounceSecondPageView.m
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//发布的二级页面中第一个VIEW

#import "anounceSecondPageView.h"
#import "lzhReturnView.h"
#import "appCommonAttributes.h"
#import "announSecondPageSelectView.h"
#import "announceSecondPageNextStepButt.h"
#import "announSecondPageNextStepView.h"

//选择控件的宽度
#define SELECT_BUTTON_WIDTH 80
//选择控件的高度
#define SELECT_BUTTON_HEIGHT 30
//各模块控件垂直方向上的间距（用的统一间距）
#define VERTICAL_SPACE 30

@interface anounceSecondPageView ()<UITextFieldDelegate>{
    announSecondPageNextStepView *nextView;
}

@end

@implementation anounceSecondPageView

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<announceSecondPageDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = delegate;
        self.backgroundColor = [UIColor whiteColor];
        //添加上部返回view
        self.ownButt = self.returnView.ownButt;
        self.ownTitleLabel = self.returnView.ownTitleLabel;
        [self.ownButt setTitle:@"<<" forState:UIControlStateNormal];
        [self.returnView.ownButt addTarget:self action:@selector(returnHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.returnView.backgroundColor = RGBA(135,206,250, 1);
        //上传图片按钮
        self.photoButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.photoButt.frame = CGRectMake(5, self.returnView.frame.origin.y + self.returnView.frame.size.height + VERTICAL_SPACE, 100, 100);
         self.photoButt.center = CGPointMake(self.frame.size.width / 2, self.photoButt.center.y);
        //photoButt.backgroundColor = [UIColor grayColor];
        [ self.photoButt setImage:[UIImage imageNamed:@"anounSecondPhotoButt"] forState:UIControlStateNormal];
        [ self.photoButt addTarget:self action:@selector(uploadPhoto) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: self.photoButt];
        //输入技术名称
        UILabel *technologyNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,  self.photoButt.frame.origin.y +  self.photoButt.frame.size.height + VERTICAL_SPACE, 100, 30)];
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
        UILabel *technologeDirectionLabe = [[UILabel alloc]initWithFrame:CGRectMake(technologyNameLabel.frame.origin.x, nameField.frame.origin.y + nameField.frame.size.height + VERTICAL_SPACE, technologyNameLabel.frame.size.width, technologyNameLabel.frame.size.height)];
        technologeDirectionLabe.font = technologyNameLabel.font;
        technologeDirectionLabe.text = @"技术方向：";
        [self addSubview:technologeDirectionLabe];
        for (NSInteger i = 0; i < 12; i ++){
            announSecondPageSelectView *selectView = [[announSecondPageSelectView alloc]initWithFrame:CGRectMake(technologeDirectionLabe.frame.origin.x + technologeDirectionLabe.frame.size.width + (i % 3) * SELECT_BUTTON_WIDTH, technologeDirectionLabe.frame.origin.y + i / 3 * SELECT_BUTTON_HEIGHT, SELECT_BUTTON_WIDTH, SELECT_BUTTON_HEIGHT)];
            selectView.ownContentLabe.text = @"技术方向";
            [self addSubview:selectView];
        }
        //技术投资
        UILabel *technologeInvesmentLabe = [[UILabel alloc]initWithFrame:CGRectMake(technologeDirectionLabe.frame.origin.x, technologeDirectionLabe.frame.origin.y + VERTICAL_SPACE + 12 / 3 * SELECT_BUTTON_HEIGHT, technologeDirectionLabe.frame.size.width, technologeDirectionLabe.frame.size.height)];
        technologeInvesmentLabe.font = technologeDirectionLabe.font;
        technologeInvesmentLabe.text = @"技术投资：";
        [self addSubview:technologeInvesmentLabe];
        for (NSInteger i = 0; i < 6; i ++){
            announSecondPageSelectView *selectView = [[announSecondPageSelectView alloc]initWithFrame:CGRectMake(technologeInvesmentLabe.frame.origin.x + technologeInvesmentLabe.frame.size.width + (i % 3) * SELECT_BUTTON_WIDTH, technologeInvesmentLabe.frame.origin.y + i / 3 * SELECT_BUTTON_HEIGHT, SELECT_BUTTON_WIDTH, SELECT_BUTTON_HEIGHT)];
            selectView.ownContentLabe.text = @"技术投资";
            [self addSubview:selectView];
        }
        //上一步按钮
        announceSecondPageNextStepButt *buttView = [[announceSecondPageNextStepButt alloc]initWithFrame:CGRectMake(technologeInvesmentLabe.frame.origin.x,self.frame.size.height - 100 , self.frame.size.width -  2 * technologeInvesmentLabe.frame.origin.x, 40)];
        [buttView.nextButt setBackgroundImage:[UIImage imageNamed:@"nextButton"] forState:UIControlStateNormal];
        buttView.nextButt.userInteractionEnabled = YES;
        [buttView.nextButt setTitle:@"下一步" forState:UIControlStateNormal];
        [buttView.nextButt addTarget:self action:@selector(nextStepHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttView];
        //
        nextView = [[announSecondPageNextStepView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, self.returnView.frame.size.height + self.returnView.frame.origin.y, SCREEN_WIDTH, self.frame.size.height - self.returnView.frame.origin.y - self.returnView.frame.size.height)];
        [self addSubview:nextView];
    }
    return self;
}
- (void)returnHandler:(UIButton*)_b{
    
    if(self.delegate){
        [self.delegate returnHandler];
    }
}
//上传图片
- (void)uploadPhoto{
    
    if(self.delegate){
        [self.delegate choosePhoto];
    }
    
}
//代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)nextStepHandler:(UIButton*)_b{
    //NSLog(@"下一步");
    [UIView animateWithDuration:0.8 animations:^{
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
