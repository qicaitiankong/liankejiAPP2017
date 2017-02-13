//
//  lzhPickerView.m
//  Liankeji
//
//  Created by mac on 2017/2/13.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhPickerView.h"


@interface lzhPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    UIPickerView *pickerView;
    NSInteger rows;
    NSInteger selectRow;
    NSArray *titleContenArr;
}

@end

@implementation lzhPickerView


- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray*)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        rows = titleArr.count;
        titleContenArr = titleArr;
        pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width , self.frame.size.height * 0.8)];
        pickerView.backgroundColor = [UIColor whiteColor];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        [self addSubview:pickerView];
        //
        UIButton *cancelButt = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButt.tag = 0;
        cancelButt.frame = CGRectMake(0, pickerView.frame.size.height, self.frame.size.width / 2, self.frame.size.height * 0.2);
        cancelButt.backgroundColor = [UIColor grayColor];
        [cancelButt setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButt addTarget:self action:@selector(buttHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelButt];
        //
        UIButton *sureButt = [UIButton buttonWithType:UIButtonTypeCustom];
        sureButt.tag = 1;
        sureButt.frame = CGRectMake(cancelButt.frame.size.width + 1, pickerView.frame.size.height, self.frame.size.width / 2 - 1, self.frame.size.height * 0.2);
        sureButt.backgroundColor = [UIColor grayColor];
        [sureButt setTitle:@"确认" forState:UIControlStateNormal];
        [sureButt addTarget:self action:@selector(buttHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sureButt];

    }
    return self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return rows;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title = nil;
    if(titleContenArr[row] != nil){
        title = titleContenArr[row];
    }
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectRow = row;
    NSLog(@"选择了第几行=%li",row);
}

- (void)buttHandler:(UIButton*)_b{
    if(self.targetDelegate){
        if(_b.tag == 0){
          [self.targetDelegate getPickerInfomation:@"" buttonTag:_b.tag];
        }else{
            [self.targetDelegate getPickerInfomation:titleContenArr[selectRow] buttonTag:_b.tag];
        }
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
