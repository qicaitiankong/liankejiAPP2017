//
//  CommunicateFirstViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/15.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "CommunicateFirstViewController.h"
#import "appCommonAttributes.h"
#import "lzhFindPageTableHeader.h"
#import "LCReleaseCell.h"
#import "LCBiddingCell.h"
#import "LCRecruitCell.h"
#import "lzhFindJobCell.h"

@interface CommunicateFirstViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *findTableview;
}

@end

@implementation CommunicateFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(246, 246, 246, 1);
    [self initTableview];
    // Do any additional setup after loading the view.
}

//表示图
- (void)initTableview{
    findTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height) style:UITableViewStyleGrouped];
    findTableview.showsVerticalScrollIndicator = false;
    [findTableview setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [findTableview setSeparatorColor:[UIColor grayColor]];
    findTableview.delegate = self;
    findTableview.dataSource = self;
    [self.view addSubview:findTableview];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 4;
    }else if (section ==2){
        return 3;
    }else{
        return 4;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LCReleaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LCReleaseCell"];
        if(cell == nil){
            cell = [[LCReleaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LCReleaseCell"];
            cell.releaseDic = nil;
        }
        return cell;
    }else if (indexPath.section == 1){
        LCBiddingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LCBiddingCell"];
        if(cell == nil){
            cell = [[LCBiddingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LCBiddingCell"];
            cell.biddingDic = nil;
        }
        return cell;
    }else if (indexPath.section == 2){
        LCRecruitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LCRecruitCell"];
        if(cell == nil){
            cell = [[LCRecruitCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LCRecruitCell"];
            cell.LCRecruitDic = nil;
        }
        return cell;
    }else{
        lzhFindJobCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lzhFindJobCell"];
        if(cell == nil){
            cell = [[lzhFindJobCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"lzhFindJobCell" targetTableView:tableView];
        }
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return SCREEN_WIDTH/3.0*1.5+20;
    }else if (indexPath.section == 1){
        return 100;
    }else if (indexPath.section == 2){
        return 230;
    }else{
        return 100;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    lzhFindPageTableHeader *hederView = [[lzhFindPageTableHeader alloc]initWithFrame:CGRectMake(0, -100, SCREEN_WIDTH, 100) isFindPerson:YES];
    return hederView;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (void)communicatePage{
    
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
