//
//  BasicViewControllerOfAllMainPage.m
//  Liankeji
//
//  Created by mac on 2017/2/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "BasicViewControllerOfAllMainPage.h"
#import "searchViewController.h"

@interface BasicViewControllerOfAllMainPage ()

@end

@implementation BasicViewControllerOfAllMainPage

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"链科技ChinaTech";
    UIColor *titleColor = NAVIGATION_TITLE_COLOR;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
    //导航栏左按钮点击事件
    UIImage *searchImage = [UIImage imageNamed:@"nav2"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:searchImage style:UIBarButtonItemStyleDone target:self action:@selector(rightSearchHandler:)];
    
    // Do any additional setup after loading the view.
}

//导航栏右侧搜索按钮
- (void)rightSearchHandler:(UIBarButtonItem*)_u{
    searchViewController *searchVC = [[searchViewController alloc]init];
    [self presentViewController:searchVC animated:YES completion:^{
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
