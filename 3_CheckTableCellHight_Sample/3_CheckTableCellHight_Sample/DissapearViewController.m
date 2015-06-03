//
//  DissapearViewController.m
//  3_CheckTableCellHight_Sample
//
//  Created by satoutakeshi on 2015/05/27.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "DissapearViewController.h"

@interface DissapearViewController ()
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secontVertualConstraint;
- (IBAction)dissapearView:(UIBarButtonItem *)sender;
@end

@implementation DissapearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*
 Labelのテキストがない場合にトルツメさせるメソッド
 */
- (IBAction)dissapearView:(UIBarButtonItem *)sender {
    self.secondLabel.text = nil;
    self.secontVertualConstraint.constant = 0.f;
    
    //せっかくなのでアニメーション
    [UIView animateWithDuration:0.5f
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}
@end
