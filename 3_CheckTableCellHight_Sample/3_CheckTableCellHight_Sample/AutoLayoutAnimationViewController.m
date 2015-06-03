//
//  AutoLayoutAnimationViewController.m
//  3_CheckTableCellHight_Sample
//
//  Created by satoutakeshi on 2015/05/25.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "AutoLayoutAnimationViewController.h"

@interface AutoLayoutAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

- (IBAction)changePositonForViews:(UIBarButtonItem *)sender;

@end

@implementation AutoLayoutAnimationViewController

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


- (IBAction)changePositonForViews:(UIBarButtonItem *)sender {
    
    //いったん制約を解除
    [self.contentView layoutIfNeeded];
    [self.contentView removeConstraints:self.contentView.constraints];
    
    //変数名をキー、その値をバリューにして辞書を作成
    NSDictionary *views = NSDictionaryOfVariableBindings(_redView, _yellowView, _blueView);
    
    //キーにした変数名をシャッフルする
    NSArray *viewNames = [self clockwiseRotationArrayFromArry:views.allKeys];
    
    //シャッフルした変数名を取得
    NSString *topViewKey = viewNames[0];
    NSString *leftViewKey = viewNames[1];
    NSString *rightViewKey = viewNames[2];
    
    //VFLで文字列をまとめる
    NSString *horizontalFormat      =   [NSString stringWithFormat:@"H:|-20-[%@]-20-|", topViewKey];
    NSString *addHorizontalFormat   =   [NSString stringWithFormat:@"H:|-20-[%1$@]-20-[%2$@(==%1$@)]-20-|", leftViewKey,rightViewKey];
    NSString *verticalFormat        =   [NSString stringWithFormat:@"V:|-88-[%1$@]-20-[%2$@(==%1$@)]-20-|", topViewKey, leftViewKey];
    NSString *addVertivalFormat     =   [NSString stringWithFormat:@"V:|-88-[%1$@]-20-[%2$@(==%1$@)]-20-|", topViewKey, rightViewKey];
    
    

    //制約を設定する
    [self.contentView addConstraints:[NSLayoutConstraint
                                     constraintsWithVisualFormat:horizontalFormat
                                     options:0
                                     metrics:nil
                                     views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:addHorizontalFormat
                                      options:NSLayoutFormatAlignAllTop
                                      metrics:nil
                                      views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:verticalFormat
                                      options:0
                                      metrics:nil
                                      views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:addVertivalFormat
                                      options:0
                                      metrics:nil
                                      views:views]];
    
    //アニメーションメソッドで親ビューに対してlayoutIfNeededを実行して再描写する
    [UIView animateWithDuration:1.0f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.contentView layoutIfNeeded];
                     }completion:nil];
    
}


/*
 配列要素を入れ替えるメソッド
 */
-(NSArray *)clockwiseRotationArrayFromArry:(NSArray *)array
{
    NSMutableArray *rotationArray = [array mutableCopy];
    NSInteger count = [rotationArray count];
    
    for (NSInteger i = 0; i < count - 1; i++) {
        
        [rotationArray exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
        
    }
    
    return [rotationArray copy];
}
@end
