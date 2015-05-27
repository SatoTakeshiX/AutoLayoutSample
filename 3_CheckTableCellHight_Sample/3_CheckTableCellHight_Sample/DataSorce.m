//
//  DataSorce.m
//  3_CheckTableCellHight_Sample
//
//  Created by satoutakeshi on 2015/05/22.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "DataSorce.h"

@implementation DataSorce

-(instancetype)initWithTitle:(NSString *)title body:(NSString *)body;
{
    if (self = [super init]) {
        self.title = title;
        self.body = body;
    }
    
    return self;
}



@end
