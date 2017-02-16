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
#import "appCommonAttributes.h"

@interface CommunicateFirstViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *leftTableview;
    UIImage *imageTest;
}

@end

@implementation CommunicateFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(246, 246, 246, 1);
    imageTest = [UIImage imageNamed:@"a1"];
    [self initTableview];
    // Do any additional setup after loading the view.
}

//左边表示图
- (void)initTableview{
    leftTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height) style:UITableViewStylePlain];
    leftTableview.delegate = self;
    leftTableview.dataSource = self;
    [self.view addSubview:leftTableview];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"findFirstPageLeftCell"];
    if(nil == cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"findFirstPageLeftCell"];
    }
    cell.textLabel.text = @"项目技术";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}



- (void)communicatePage{
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
            [self.navigationController pushViewController:messageVC animated:NO];
        }else{
            NSLog(@"登录失败");
        }
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
