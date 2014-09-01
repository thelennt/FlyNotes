//
//  Recording.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/5/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol Recording <NSObject>

typedef enum RecordState : NSUInteger {
    PLAYING,
    STOPPED,
    PAUSED
} RecordState;

-(NSString*)createRecordingNode;
- (IBAction)recordPause:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)play:(NSTimeInterval) thisTime;

- (IBAction)play;
@end
