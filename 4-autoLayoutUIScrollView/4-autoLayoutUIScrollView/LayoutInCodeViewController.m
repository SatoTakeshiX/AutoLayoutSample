//
//  LayoutInCodeViewController.m
//  4-autoLayoutUIScrollView
//
//  Created by satoutakeshi on 2015/06/02.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "LayoutInCodeViewController.h"

@interface LayoutInCodeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation LayoutInCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //ナビゲーションコントローラーを使ってビューコントローラーを管理している場合は下記設定が必要
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //横フリックして2ページを切り替えられるようにする
    //スクリーン領域を取得する
    CGRect screenRect = [[UIScreen mainScreen]applicationFrame];
    
    //1つ目のビューのインスタンス
    UIView *page1 = [UIView new];
    page1.backgroundColor = [UIColor redColor];
    
    //２つ目のビューのインスタンス
    UIView *page2 = [UIView new];
    page2.backgroundColor = [UIColor greenColor];
    
    //スクロールビューにページを追加
    [self.myScrollView addSubview:page1];
    [self.myScrollView addSubview:page2];
    
    // AutoLayoutoに対応するため AutoresizingMaskをオフにする
    self.myScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    page1.translatesAutoresizingMaskIntoConstraints = NO;
    page2.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSString *constraintPage1Vertical   =   [NSString stringWithFormat:@"V:|-[page1(==%f)]-|", screenRect.size.height];
    NSString *constraintPage2Vertical   =   [NSString stringWithFormat:@"V:|-[page2(==%f)]-|", screenRect.size.height];

    NSString *constraintHorizontal      =   [NSString stringWithFormat:@"H:|-[page1(==%1$f)]-[page2(==%1$f)]-|", screenRect.size.height];
    
    //制約を追加
    [self.myScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintPage1Vertical
                                                                              options:0
                                                                              metrics:0
                                                                                views:NSDictionaryOfVariableBindings(page1,page2)]];

    
    //制約を追加
    [self.myScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintPage2Vertical
                                                                              options:0
                                                                              metrics:0
                                                                                views:NSDictionaryOfVariableBindings(page1,page2)]];
    
    //制約を追加
    [self.myScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintHorizontal
                                                                              options:0
                                                                              metrics:0
                                                                                views:NSDictionaryOfVariableBindings(page1,page2)]];
    
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
