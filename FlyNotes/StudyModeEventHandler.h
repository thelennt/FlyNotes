//
//  StudyModeEventHandler.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/14/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesStore.h"
#import "CanvasStore.h"
#import "Recording.h"

@interface StudyModeEventHandler : NSObject
{
    NotesStore* mNotesStore;
    CanvasStore* mCanvasStore;
    NSObject* recording;
}
- (id) init:(NotesStore*)store canvasStore:(CanvasStore*)canvas recording:(NSObject*)recording;

- (void) screenselected:(NSNumber*)x y:(NSNumber*) y;
- (void) timeLapse:(NSNumber*)time;

- (void) nextPage;
- (void) previousPage;

- (void) playRecording;
- (void) stopRecording;

- (void) save;
- (void) load;
@end
