//
//  CustamTableViewCell.m
//  3_CheckTableCellHight_Sample
//
//  Created by satoutakeshi on 2015/05/22.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "CustamTableViewCell.h"

@implementation CustamTableViewCell
@synthesize dataSorce = _dataSorce;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataSorce:(DataSorce *)dataSorce
{
    self.titleLabel.text    =   dataSorce.title;
    self.bodyLabel.text     =   dataSorce.body;
    [self layoutIfNeeded];
    //→layoutSubviewsが呼ばれる！
}
-(DataSorce *)dataSorce
{
    return _dataSorce;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //ラベルの横幅をpreferredMaxLayoutWidthで設定する。(高さ計算で必要）
    self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.titleLabel.bounds);
    self.bodyLabel.preferredMaxLayoutWidth  = CGRectGetWidth(self.bodyLabel.bounds);
}

+(CGFloat)heightForRowWithTable:(UITableView *)tableView
                      dataSorce:(DataSorce *)dataSorce
{
    CustamTableViewCell *cell;
    
    cell = (CustamTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"custam"];
    
    if (cell) {
        cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y
                                     , CGRectGetWidth(tableView.bounds), cell.frame.size.height);
        
        cell.dataSorce = dataSorce;
        
        //Autolayoutが適用された後の高さサイズを取得する
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        return size.height;
    }else{
        return 0;
    }
}

@end
