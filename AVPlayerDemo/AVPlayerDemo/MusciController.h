//
//  AVPlay.h
//  AVPlayerDemo
//
//  Created by sky on 14/6/12.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MusciController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer *musciPlayer;
}

@property (strong, nonatomic) IBOutlet UISlider *currentTime;
@property (strong, nonatomic) IBOutlet UISlider *voice;
@property (strong, nonatomic) IBOutlet UILabel *maxTime;
@property (strong, nonatomic) IBOutlet UILabel *currentTimeLabel;
- (IBAction)playAction:(UIButton *)sender;
- (IBAction)tiemAction:(UISlider *)sender;
- (IBAction)voiceAction:(UISlider *)sender;

@end
