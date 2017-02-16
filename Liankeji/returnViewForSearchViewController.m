//
//  returnViewForSearchViewController.m
//  Liankeji
//
//  Created by mac on 2017/2/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "returnViewForSearchViewController.h"
@interface returnViewForSearchViewController ()<UITextFieldDelegate>

@end

@implementation returnViewForSearchViewController

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        //
        self.returnButt = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.returnButt setTitle:@"返回" forState:UIControlStateNormal];
        self.returnButt.frame = CGRectMake(2, 5, self.frame.size.width * 0.1, self.frame.size.height * 0.6);
         self.returnButt.center = CGPointMake(self.returnButt.center.x, self.frame.size.height / 2);
        //self.returnButt.backgroundColor = [UIColor blackColor];
        [self addSubview:self.returnButt];
        //
        self.searchField = [[UITextField alloc]initWithFrame:CGRectMake(self.returnButt.frame.size.width + 30, self.returnButt.frame.origin.y, self.frame.size.width * 0.6, self.frame.size.height * 0.6)];
        self.searchField.backgroundColor = [UIColor whiteColor];
        self.searchField.layer.cornerRadius = 5;
        self.searchField.placeholder = @"请输入搜索";
        self.searchField.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        self.searchField.returnKeyType = UIReturnKeySearch;
        self.searchField.delegate = self;
        [self addSubview:self.searchField];
        //
        self.searchButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.searchButt.frame = CGRectMake(self.searchField.frame.origin.x + self.searchField.frame.size.width + 5, self.searchField.frame.origin.y , self.searchField.frame.size.height, self.searchField.frame.size.height);
        self.searchButt.layer.cornerRadius = 5;
        [self.searchButt setImage:[UIImage imageNamed:@"nav2"] forState:UIControlStateNormal];
        [self.searchButt addTarget:self action:@selector(searchHandler:) forControlEvents:UIControlEventTouchUpInside];
        //self.searchButt.backgroundColor = [UIColor redColor];
        [self addSubview:self.searchButt];
        
        
    }
    return self;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"开始编辑");
    if(self.targetDelegate){//弹出历史记录
        [self.targetDelegate setSearchHistoryView];
    }
}
//回车键
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    self.searchButt.userInteractionEnabled = YES;
    if(self.targetDelegate){//
        [self.targetDelegate clickSearch:textField];
    }
    NSLog(@"点击了回车搜索");
    return YES;
}

//点击了搜索图片
- (void)searchHandler:(UIButton*)_b{
    if(![self.searchField isFirstResponder]){
        NSLog(@"弹出键盘");
        [self.searchField becomeFirstResponder];
        
        _b.userInteractionEnabled = NO;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
