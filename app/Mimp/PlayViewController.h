//
//  PlayViewController.h
//  Mimp
//
//  Created by Sota Yamashita on 8/26/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *myArtistLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderValueWasChanged;


- (IBAction)nextSongButton:(id)sender;
- (IBAction)prevSongButton:(id)sender;
@end
