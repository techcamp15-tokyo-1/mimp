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
    // 自動再生
    [audioPlayer play];
    if(!error) {
        [audioPlayer prepareToPlay];
        [self setButtonAndSlider];
        audioPlayer_ = audioPlayer;
    } else {
        NSLog(@"AVAudioPlayer Error");
    }

   
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
    if (audioPlayer_.isPlaying) {
        UIImage *img    = [UIImage imageNamed:@"play.png"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(123, 305, 74, 74);
        button.tag = 1;
        [button setBackgroundImage:img forState:UIControlStateNormal];
        [button setTitle:@"" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    } else { 
        UIImage *img    = [UIImage imageNamed:@"pouse.png"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(123, 305, 74, 74);
        button.tag = 2;
        [button setBackgroundImage:img forState:UIControlStateNormal];
        [button setTitle:@"" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    
    // 音量調整
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(40,375,230, 40)];
    slider.minimumValue = 0.0f;
    slider.maximumValue = 1.0f;
    slider.value = 0.5f;
    slider_ = slider;
    [slider addTarget:self action:@selector(sliderValueWasChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}


- (IBAction)nextSongButton:(id)sender {
}

- (IBAction)prevSongButton:(id)sender {
}


@end
