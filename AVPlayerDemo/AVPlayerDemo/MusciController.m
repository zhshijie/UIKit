//
//  AVPlay.m
//  AVPlayerDemo
//
//  Created by sky on 14/6/12.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MusciController.h"

@interface MusciController ()

@end

@implementation MusciController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"爱情转移"ofType:@"mp3"];
    NSURL *musicURL = [NSURL fileURLWithPath:musicPath];
    musciPlayer= [[AVAudioPlayer alloc]initWithContentsOfURL:musicURL error:NULL];
    [musciPlayer prepareToPlay];
    
    musciPlayer.delegate = self;
    
    musciPlayer.numberOfLoops = 1.0;
    self.voice.maximumValue = 1.0;
    self.voice.minimumValue = 0.0;
    self.currentTime.minimumValue = 0.0;
    self.currentTime.maximumValue = musciPlayer.duration;
    
    self.currentTimeLabel.text = @"0:00";
    
    NSString *maxtime = [NSString stringWithFormat:@"%d:%d",(int)musciPlayer.duration/60,(int)musciPlayer.duration%60];
    self.maxTime.text = maxtime;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(TimePlayAction:) userInfo:nil repeats:YES];
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"播放结束");
}


-(void)TimePlayAction:(NSTimer*)timer
{
    if(musciPlayer.playing)
    {
        NSString *currentTime = [NSString stringWithFormat:@"%d:%d",(int)musciPlayer.currentTime/60,(int)musciPlayer.currentTime%60];
        self.currentTimeLabel.text = currentTime;
        self.currentTime.value = musciPlayer.currentTime;
    }
}


- (IBAction)playAction:(UIButton *)sender {
    if (musciPlayer.playing) {
        [musciPlayer pause];
        [sender setTitle:@"播放"forState:UIControlStateNormal];
    }
    else{
        [musciPlayer play];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
    }
}

- (IBAction)tiemAction:(UISlider *)sender {
    musciPlayer.currentTime = sender.value;
}

- (IBAction)voiceAction:(UISlider *)sender {
    musciPlayer.volume = sender.value;
}

@end
