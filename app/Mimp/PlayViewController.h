//
//  PlayViewController.h
//  Mimp
//
//  Created by Sota Yamashita on 8/26/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayViewController : UIViewController <MPMediaPickerControllerDelegate> {
    
    MPMusicPlayerController *musicPlayer;
    // アルバムアートワーク
    __weak IBOutlet UIImageView *artworkImageView;
    // ポーズボタン
    __weak IBOutlet UIButton *playPauseButton;
    // 音量調整
     __weak IBOutlet UISlider *volumeSlider;
}

@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *myArtistLabel;
@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;

//　音量再生
- (IBAction)volumeChanged:(id)sender;

// 前の曲
- (IBAction)previousSong:(id)sender;

// 再生
- (IBAction)playSong:(id)sender;

// 次の曲
- (IBAction)nextSong:(id)sender;

@end
