//
//  CommunicateFirstViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/15.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "CommunicateFirstViewController.h"
#import <Hyphenate_CN/EMSDKFull.h>
#import <EaseUI.h>

@interface CommunicateFirstViewController ()

@end

@implementation CommunicateFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.alpha = 0.25;
    //环信注册登录测试
    [[EMClient sharedClient]registerWithUsername:@"lzhlsh2017" password:@"123" completion:^(NSString *aUsername, EMError *aError) {
        if(!aError){
            NSLog(@"注册成功");
        }else{
            NSLog(@"注册失败");
        }
    }];
    
    [[EMClient sharedClient]loginWithUsername:@"lzhlsh2017" password:@"123" completion:^(NSString *aUsername, EMError *aError) {
        if(!aError){
            NSLog(@"登录成功");
            EaseMessageViewController *messageVC = [[EaseMessageViewController  alloc]initWithConversationChatter:@"lsh" conversationType:EMConversationTypeChat];
            [self presentViewController:messageVC animated:NO completion:nil];
        }else{
            NSLog(@"登录失败");
        }
    }];

    
    
    //[self.navigationController.navigationItem setTitle:@"链科技"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
