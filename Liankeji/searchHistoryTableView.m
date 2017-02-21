//
//  searchHistoryTableView.m
//  Liankeji
//
//  Created by mac on 2017/2/17.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "searchHistoryTableView.h"
#import "searchHistoryTableViewCell.h"
#import "appCommonAttributes.h"

#define CELL_HEIGHT  SCREEN_HEIGHT * 0.04;

@interface searchHistoryTableView ()<UITableViewDataSource,UITableViewDelegate>{

    }
@end

@implementation searchHistoryTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        self.scrollEnabled = NO;
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"历史记录行数:%li",_contentArr.count);
    return _contentArr.count;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchHistoryCell"];
    searchHistoryTableViewCell *cell2 = nil;
    if(nil == cell){
        cell2 = [[searchHistoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchHistoryCell" tableView:self];
    }
    cell2.historyLabel.text = self.contentArr[indexPath.row];
    cell2.cancelButt.tag = indexPath.row;
    //[cell2.cancelButt addTarget:self action:@selector(deleteCell:) forControlEvents:UIControlEventTouchUpInside];
    return cell2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CELL_HEIGHT;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CELL_HEIGHT;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = nil;
    CGFloat height = CELL_HEIGHT;
    UILabel *searchHeaderView = [[UILabel alloc]initWithFrame:CGRectMake(0, -height, tableView.frame.size.width, height)];
    searchHeaderView.text = @"搜索历史";
    searchHeaderView.textAlignment = NSTextAlignmentCenter;
    headerView = searchHeaderView;
    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CGFloat height = CELL_HEIGHT;
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(0, tableView.frame.size.height, tableView.frame.size.height, height);
    butt.backgroundColor = [UIColor redColor];
    [butt setTitle:@"清除记录" forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(clearHandler:) forControlEvents:UIControlEventTouchUpInside];
    return butt;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"section:%li row :%li",indexPath.section,indexPath.row);
    if(self.targetDelegate){
        searchHistoryTableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
        NSString *searchContent = [cell.historyLabel.text copy];
        [self.targetDelegate setHistoryContentGiveTextField:searchContent];
    }
}


//全部清除按钮
- (void)clearHandler:(UIButton*)_b{
    if(self.targetDelegate){
        [self.targetDelegate deleteAllHistoryContent];
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
