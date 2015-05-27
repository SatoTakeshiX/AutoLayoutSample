//
//  DataSorce.h
//  3_CheckTableCellHight_Sample
//
//  Created by satoutakeshi on 2015/05/22.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSorce : NSDictionary
@property NSString *title;
@property NSString *body;

-(instancetype)initWithTitle:(NSString *)title body:(NSString *)body;
@end
