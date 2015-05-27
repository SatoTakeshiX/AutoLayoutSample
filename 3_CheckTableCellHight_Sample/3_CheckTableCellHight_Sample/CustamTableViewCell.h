//
//  CustamTableViewCell.h
//  3_CheckTableCellHight_Sample
//
//  Created by satoutakeshi on 2015/05/22.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataSorce.h"
@interface CustamTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property DataSorce *dataSorce;

+(CGFloat)heightForRowWithTable:(UITableView *)tableView
                      dataSorce:(DataSorce *)dataSorce;
@end
