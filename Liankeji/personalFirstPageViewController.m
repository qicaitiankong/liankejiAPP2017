//
//  personalFirstPageViewController.m
//  Liankeji
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "personalFirstPageViewController.h"
#import "personalViewOfFirstPage.h"
#import "PersonalTableViewCell.h"
#import "appCommonAttributes.h"
#import "personalFirstPageUserTableViewCell.h"
#import "LZHTabBarController.h"

@interface personalFirstPageViewController ()<UITableViewDelegate,UITableViewDataSource>{
    personalViewOfFirstPage *secondHeaderView;
    UITableView *ownTableView;
    UIView *spaceView;
    UIView *spaceView2;
    //组头图片及标题数组
    NSArray *secondSectionImageArr;
    NSArray *secondSectionTitleArr;
    NSArray *thirdSectionImageArr;
    NSArray *thirdSectionTitleArr;
    NSArray *fourthSectionImageArr;
    NSArray *fourthSectionTitleArr;
}
@end

@implementation personalFirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(246, 246, 246, 1);
    secondSectionImageArr = @[[UIImage imageNamed:@"personalFirstPageMyMessage"],[UIImage imageNamed:@"personalFirstPageMyPraise"],[UIImage imageNamed:@"personalFirstPageMyCollection"]];
     secondSectionTitleArr = @[@"我的消息",@"我的点赞",@"我的收藏"];

     thirdSectionImageArr = @[[UIImage imageNamed:@"personalFirstPageMyWallet"],[UIImage imageNamed:@"personalFirstPageMyJifen"],[UIImage imageNamed:@"personalFirstPageMemberCenter"]];
    thirdSectionTitleArr = @[@"我的钱包",@"我的积分",@"会员中心"];
    fourthSectionImageArr = @[[UIImage imageNamed:@"personalFirstPageCustomer"],[UIImage imageNamed:@"personalFirstPageUs"]];
    fourthSectionTitleArr = @[@"客服中心",@"关于我们"];
    
    secondHeaderView = [[personalViewOfFirstPage alloc]initWithFrame:CGRectMake(0, - SCREEN_HEIGHT * 0.089, self.view.frame.size.width, SCREEN_HEIGHT * 0.089) numArr:@[@"123",@"23",@"322"] titleArray:@[@"发布的消息",@"关注",@"粉丝"]];
    spaceView = [[UIView alloc]initWithFrame:CGRectMake(0,  - SCREEN_HEIGHT * 0.02, self.view.frame.size.width, SCREEN_HEIGHT * 0.02)];
    spaceView.backgroundColor = RGBA(246, 246, 246, 1);
    spaceView2 = [[UIView alloc]initWithFrame:CGRectMake(0,  - SCREEN_HEIGHT * 0.02, self.view.frame.size.width, SCREEN_HEIGHT * 0.02)];
    spaceView2.backgroundColor = RGBA(246, 246, 246, 1);
    [self initTableView];
    
    // Do any additional setup after loading the view.
}


- (void)initTableView{
    ownTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_HEIGHT, self.view.frame.size.width, SCREEN_HEIGHT - NAVIGATION_HEIGHT - TABBAR_HEIGHT)];
    ownTableView.backgroundColor = RGBA(246, 246, 246, 1);
    ownTableView.delegate = self;
    ownTableView.dataSource = self;
    //ownTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //ownTableView.separatorColor = [UIColor grayColor];
    [self.view addSubview:ownTableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger myRows = 0;
    switch (section) {
        case 0:
            myRows = 1;
            break;
        case 1:
            myRows = 3;
            break;
        case 2:
            myRows = 3;
            break;
        case 3:
            myRows = 2;
            break;
        default:
            break;
    }
    
    return myRows;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if(indexPath.section == 0){
        personalFirstPageUserTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"personalCell1"];
        if(nil == cell){
            cell1 = [[personalFirstPageUserTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"personalCell1" _tableview:tableView];
        }
        //cell1.userImageView.image = ;
        cell1.userNameLabel.text = @"李自豪";
        cell1.jobLabel.text = @"私营业主";
        cell1.memberImageView.image = [UIImage imageNamed:@"personalFirstPageMember"];
        cell1.memberNameLabel.text = @"黄金会员";
        cell = cell1;
    }else{
        PersonalTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"personalCell2"];
        if(nil == cell2){
            cell2 = [[PersonalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"personalCell2" _tableview:tableView];
        }
        NSArray *imageArr = nil;
        NSArray *titleArray = nil;
        switch (indexPath.section) {
            case 1:
                imageArr = secondSectionImageArr;
                titleArray = secondSectionTitleArr;
                break;
            case 2:
                imageArr = thirdSectionImageArr;
                titleArray = thirdSectionTitleArr;
                break;
            case 3:
                imageArr = fourthSectionImageArr;
                titleArray = fourthSectionTitleArr;
                break;
            default:
                break;
        }
        [cell2.firstImageView setImage:imageArr[indexPath.row]];
        [cell2.secondTitleLable setText:titleArray[indexPath.row]];
        cell = cell2;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 0;
    if(indexPath.section == 0){
        rowHeight = SCREEN_HEIGHT * 0.107;
    }else{
        rowHeight = SCREEN_HEIGHT * 0.073;
    }
    return rowHeight;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *sectionView = nil;
    switch (section) {
        case 0:
            //没有组头
            break;
        case 1:
            return secondHeaderView;
            break;
        case 2:
            return spaceView;
            break;
        case 3:
            return spaceView2;
            break;
        default:
            break;
    }
    return sectionView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger height = 0;
    switch (section) {
        case 0:
            height = 0;
            break;
        case 1:
            height = secondHeaderView.frame.size.height;
            break;
        case 2:
            height = spaceView.frame.size.height;
            break;
        case 3:
            height = spaceView.frame.size.height;
            break;
        default:
            break;
    }
    return height;
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
