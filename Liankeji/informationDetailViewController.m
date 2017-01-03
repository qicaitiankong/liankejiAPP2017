//
//  informationDetailViewController.m
//  Liankeji
//
//  Created by mac on 2016/12/30.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationDetailViewController.h"
#import "firstOwnCellView.h"
#import "informationSecondPgeTavCell.h"


@interface informationDetailViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *ownTableView;
}

@end

@implementation informationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    firstOwnCellView *v1 = [[firstOwnCellView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) titleString:@"链科技正在打造全国新的技术交流对接链科技正在打造全国新的技术交流对接"];
    //v1.ownFirstTitleLable.text = @"链科技正在打造全国新的技术交流对接平台其实对的啊天空色彩2017大雪将至";
    v1.ownAuthorLable.text = @"作者：陈教授";
    [self.view addSubview:v1];
    
    [self testFirstCell];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)testFirstCell{
     ownTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 600) style:UITableViewStylePlain];
    [self.view addSubview:ownTableView];
    ownTableView.delegate = self;
    ownTableView.dataSource = self;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 400;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"infoSecondPageCell"];
    if(nil == cell){
        cell = [[informationSecondPgeTavCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoSecondPageCell" tableView:tableView];
        cell.backgroundColor = [UIColor greenColor];
    }
    return cell;
    
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
