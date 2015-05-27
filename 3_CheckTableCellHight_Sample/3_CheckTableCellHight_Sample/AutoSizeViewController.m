//
//  AutoSizeViewController.m
//  3_CheckTableCellHight_Sample
//
//  Created by satoutakeshi on 2015/05/22.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "AutoSizeViewController.h"
#import "DataSorce.h"
#import "CustamTableViewCell.h"
@interface AutoSizeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property NSArray *dataSorces;
@end

@implementation AutoSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //データソースの作成
    DataSorce *data1 = [[DataSorce alloc]initWithTitle:@"タイトルタイトルタイトル" body:@"本文本文本文" ];
    DataSorce *data2 = [[DataSorce alloc]initWithTitle:@"タイトル\nタイトル\nタイトル" body:@"本文\n本文\n本文" ];
    DataSorce *data3 = [[DataSorce alloc]initWithTitle:@"タイトル\nタイトル\nタイトル\nタイトル"
                                                      body:@"本文\n本文\n本文\n本文\n本文\n" ];
    //データソースの格納
    self.dataSorces = [NSArray arrayWithObjects:data1, data2, data3, nil];
    
    //デリゲートを設定する
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSorces.count;
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"custam"];
    
    cell.dataSorce = self.dataSorces[indexPath.row];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataSorce *data = self.dataSorces[indexPath.row];
    CGFloat cellHeight = [CustamTableViewCell heightForRowWithTable:tableView dataSorce:data];
    return cellHeight;
}
@end
