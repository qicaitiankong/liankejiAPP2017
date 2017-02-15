//
//  BasicViewControllerForAddReturnview.m
//  Liankeji
//
//  Created by mac on 2017/2/15.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "BasicViewControllerForAddReturnview.h"
#import "appCommonAttributes.h"


@interface BasicViewControllerForAddReturnview ()

@end

@implementation BasicViewControllerForAddReturnview

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.view.frame.size.width, NAVIGATION_HEIGHT)];
    [self.returnView.ownButt setTitle:@"返回" forState:UIControlStateNormal];
    [self.returnView.ownButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.returnView];
    
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
