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
    id recording;
    int currentPage;
    int maxPage;
    double recordingTime;
    ScribbleStyle *currentStyle;
    int StyleCount;
    NoteStyle *currentNoteStyle;
    int NoteStyleCount;
    NSURL* defaultBackground;
    
}
- (id) init:(NotesStore*)lstore canvasStore:(NotesStore*)lcanvas recording:(id)lrecording background:(NSURL*)lbackground;
- (void) newPage;
- (void) newStyle:(ScribbleStyle *)style;
- (void) newEvent:(id) event;

- (void) nextPage;
- (void) previousPage;
- (void) deletePage;

- (UIImage*) getCurrentImage;

- (void) pauseRecording;
- (void) stopRecording;
- (void) playRecording;
- (void) save;
- (NSTimeInterval) getTime;
@end
