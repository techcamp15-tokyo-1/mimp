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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

AVAudioPlayer *audioPlayer_;
UISlider *slider_;

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
    self.myTitleLabel.text  = @"Tongue Tied(Remix)";
    // アーティスト名
    self.myArtistLabel.text = @"Groupove";
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource:@"demo" ofType:@"mp3"];
    NSURL *fileUrl  = [NSURL fileURLWithPath:filePath];
    
    NSError* error = nil;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:&error];
    if(!error) {
        [audioPlayer prepareToPlay];
        [self setButtonAndSlider];
        audioPlayer_ = audioPlayer;
    } else {
        NSLog(@"AVAudioPlayer Error");
    }

    // ボタンが押されたら自動再生
    [audioPlayer play];
}


/**
  * ナビゲーションバー デザイン関連
  *
  */
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
  *
  * 音楽再生関連
  * 
  *
  */
- (void)buttonWasTapped:(UIButton *)button
{
    if (button.tag == 1) {
        float volume = slider_.value;
        audioPlayer_.volume = volume;
        audioPlayer_.currentTime = 0;
        [audioPlayer_ play];
        
        NSLog(@"volume: %f", volume);
    } else {
        [audioPlayer_ pause];
    }
}

- (void)sliderValueWasChanged:(UISlider *)slider
{
    if (audioPlayer_) {
        audioPlayer_.volume = slider.value;
    }
}

- (void)setButtonAndSlider
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 50, 100, 50);
    button.tag = 1;
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(170, 50, 100, 50);
    button2.tag = 2;
    [button2 setTitle:@"Stop" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50,150,220, 0)];
    slider.minimumValue = 0.0f;
    slider.maximumValue = 1.0f;
    slider.value = 0.5f;
    slider_ = slider;
    [slider addTarget:self action:@selector(sliderValueWasChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

@end
