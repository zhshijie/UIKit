//
//  AvaudioMusciViewController.m
//  AvaudioMusicDemo
//
//  Created by sky on 14/6/13.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AvaudioMusciViewController.h"

@interface AvaudioMusciViewController ()

@end

@implementation AvaudioMusciViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"爱情转移" ofType:@"mp3"];
    NSURL *musicURl = [NSURL fileURLWithPath:musicPath];
    
    musicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:musicURl error:NULL];
    [musicPlayer prepareToPlay];
    
    musicPlayer.delegate = self;
    
    self.soundMessage.maximumValue = 1.0;
    self.soundMessage.minimumValue = 0.0;
    self.timeMessage.maximumValue = musicPlayer.duration;
    self.timeMessage.minimumValue = 0.0;
    
    self.currentTime.text = @"0:00";
    NSString *max = [NSString stringWithFormat:@"%d:%d",(int)musicPlayer.duration/60,(int)musicPlayer.duration%60];
    self.maxTIme.text = max;
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(playActionTimer:) userInfo:nil repeats:YES];
}


-(void)playActionTimer:(NSTimer*)timer
{
    if (musicPlayer.playing) {
        NSString *current = [NSString stringWithFormat:@"%d:%d",(int)musicPlayer.currentTime/60,(int)musicPlayer.currentTime%60];
        self.currentTime.text = current;
        self.timeMessage.value = musicPlayer.currentTime;
    }
}

- (void)dealloc
{
    [_soundMessage release];
    [_maxTIme release];
    [_currentTime release];
    [_timeMessage release];
    [musicPlayer release];
    [_playButton release];
    [super dealloc];
    
}

- (IBAction)SoundDidChange:(UISlider *)sender {
    musicPlayer.volume = sender.value;
}

- (IBAction)TimeDidChange:(UISlider *)sender {
    musicPlayer.currentTime = sender.value;
}

- (IBAction)playAction:(UIButton *)sender {
    if (musicPlayer.isPlaying) {
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        [musicPlayer pause];
    }
    else{
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        [musicPlayer play];
    }
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.timeMessage.value = 0.0;
    [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
}
@end
