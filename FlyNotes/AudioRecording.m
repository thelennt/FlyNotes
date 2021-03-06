//
//  AudioRecording.m
//  FlyNotes
//
//  Created by Nathan Thelen on 6/5/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "AudioRecording.h"
#import "Recording.h"
#import <AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVAudioRecorder.h>
#import <AVFoundation/AVAudioSession.h>
#import <AudioToolbox/AudioToolbox.h>

@implementation AudioRecording

@synthesize state;

- (id)init
{
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"cheeseburger.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL URLWithString:@"file://localhost/Users/thelenn1/Desktop/FlyNotes/FlyNotes/cheeseburger.m4a"];
    /*
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:NULL];
    //recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
    state = PAUSED;
     */
    NSError *error = nil;
   player = [[AVAudioPlayer alloc] initWithContentsOfURL:outputFileURL error:&error];
    player.numberOfLoops = 1;
    //[player setDelegate:self];
    [player play];

    return self;
}

- (void)didReceiveMemoryWarning
{
    //[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordPause
{
    // Stop the audio player before recording
    if (player.playing) {
        [player stop];
    }
    
    if (!recorder.recording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        
        // Start recording
        [recorder record];
        
    } else {
        
        // Pause recording
        [recorder pause];
    }
}

- (IBAction)stop
{
    [recorder stop];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
}



- (IBAction)play
{
    [self play:0];
    
}

- (NSTimeInterval)getTime
{
    return player.currentTime;
    
}

- (IBAction)play:(NSTimeInterval) thisTime
{
    if (!recorder.recording)
    {
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
        [player setDelegate:self];
        //[player playAtTime: thisTime];
    }
    state = PLAYING;
    [player playAtTime: thisTime];
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
    //                                                message: @"Finish playing the recording!"
    //                                               delegate: nil
    //                                      cancelButtonTitle:@"OK"
    //                                      otherButtonTitles:nil];

}

@end
