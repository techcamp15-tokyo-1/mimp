//
//  PlayViewController.m
//  Mimp
//
//  Created by Sota Yamashita on 8/26/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()



@end

@implementation PlayViewController

#pragma mark - Synthesizes

@synthesize musicPlayer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // 背景画像設定
    UIImage *backgroundImage = [UIImage imageNamed:@"all_background.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];

    // ナビゲーションタイトル設定
    self.navigationItem.title = @"Player";
    // タイトル
    self.myTitleLabel.text  = @"Paradise";
    // アーティスト名
    self.myArtistLabel.text = @"Cldplay";
    
    // 再生ボタン
    UIImage *play = [UIImage imageNamed:@"play.png"];  // ボタンにする画像を生成する
    // 停止ボタン
    UIImage *stop= [UIImage imageNamed:@"next.png"];  // ボタンにする画像を生成する
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(700, 100, 74, 74)];  // ボタンのサイズを指定する
    [btn setBackgroundImage:play forState:UIControlStateNormal];  // 画像をセットする
    [btn setBackgroundImage:stop forState:UIControlStateHighlighted];  // 画像をセットする
    // ボタンが押された時にhogeメソッドを呼び出す
    [btn addTarget:self
            action:@selector(hoge:) forControlEvents:UIControlEventTouchUpInside];
    
    
    musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
    
    
    [volumeSlider setValue:[musicPlayer volume]];
    
	if ([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        
        [playPauseButton setImage:[UIImage imageNamed:@"pauseButton.png"] forState:UIControlStateNormal];
        
    } else {
        
        [playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
    }
}





-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
// ナビゲーションバー非表示
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 前の曲へ
- (IBAction)previousSong:(id)sender
{
    [musicPlayer skipToPreviousItem];
}

//　音楽再生
- (IBAction)playSong:(id)sender
{
    if ([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [musicPlayer pause];
        
    } else {
        [musicPlayer play];
        
    }
}

// 次の曲へ
- (IBAction)nextSong:(id)sender
{
    [musicPlayer skipToNextItem];
}

// 音量調整
- (IBAction)volumeChanged:(id)sender {
    [musicPlayer setVolume:[volumeSlider value]];
}



@end
