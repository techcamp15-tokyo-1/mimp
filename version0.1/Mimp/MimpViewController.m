//
//  MimpViewController.m
//  Mimp
//
//  Created by Sota Yamashita on 8/25/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import "MimpViewController.h"

@interface MimpViewController ()

@end

@implementation MimpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// タイトル
    self.myLabelTitle.text = @"MIMP";
    // サブタイトル
    self.myLabelSubtitle.text = @"Music Meets LifeStyle";
    // 背景画像設定
    UIImage *backgroundImage = [UIImage imageNamed:@"bg.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// 戻った時にナビゲーションバーが消える
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


// ログインボタン
- (IBAction)loginButtonPressed:(id)sender {
}

@end
