//
//  searchViewController.m
//  Liankeji
//
//  Created by mac on 2017/1/19.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "searchViewController.h"
#import "lzhReturnView.h"


@interface searchViewController ()

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    lzhReturnView *returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.view.frame.size.width,40)];
    [returnView.ownButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [returnView.ownButt addTarget:self action:@selector(returnHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnView];
    // Do any additional setup after loading the view.
}

- (void)returnHandler:(UIButton*)_b{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
