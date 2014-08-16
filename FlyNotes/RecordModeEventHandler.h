//
//  RecordModeEventHandler.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/14/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteEvent.h"
#import "TextNoteEvent.h"
#import "Style.h"
#import "NotesStore.h"
#import "CanvasStore.h"
#import "Recording.h"

@interface RecordModeEventHandler : NSObject
{
    NotesStore* mNotesStore;
    NotesStore* mCanvasStore;
    NSObject* recording;
    int currentPage;
    int maxPage;
    double recordingTime;
    ScribbleStyle *currentStyle;
    NSString* defaultBackground;
}
- (id) init:(NotesStore*)store canvasStore:(CanvasStore*)canvas recording:(id)recording;
- (void) newPage;
- (void) newStyle:(Style *)style;
- (void) newEvent:(id) event;

- (void) nextPage;
- (void) previousPage;
- (void) deletePage;

- (void) pauseRecording;
- (void) stopRecording;

- (void) save;
@end
