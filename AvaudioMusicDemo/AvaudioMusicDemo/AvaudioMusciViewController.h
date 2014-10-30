//
//  AvaudioMusciViewController.h
//  AvaudioMusicDemo
//
//  Created by sky on 14/6/13.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AvaudioMusciViewController : UIViewController<AVAudioPlayerDelegate>
{
    AVAudioPlayer *musicPlayer;
}
@property (retain, nonatomic) IBOutlet UISlider *soundMessage;
@property (retain, nonatomic) IBOutlet UISlider *timeMessage;
@property (retain, nonatomic) IBOutlet UILabel *currentTime;
@property (retain, nonatomic) IBOutlet UILabel *maxTIme;
@property (retain, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)SoundDidChange:(UISlider *)sender;
- (IBAction)TimeDidChange:(UISlider *)sender;
- (IBAction)playAction:(UIButton *)sender;
@end
