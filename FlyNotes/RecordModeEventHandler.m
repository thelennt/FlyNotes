//
//  RecordModeEventHandler.m
//  FlyNotes
//
//  Created by Nathan Thelen on 6/14/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "RecordModeEventHandler.h"
#import "NotesPage.h"
#import "NotesTextPage.h"
#import "NotesScribblePage.h"
#import "Recording.h"
#import "SaveLocal.h"

@implementation RecordModeEventHandler

- (id) init:(NotesStore*)lstore canvasStore:(NotesStore*)lcanvas recording:(id)lrecording background:(NSString*)lbackground
{
    mNotesStore = lstore;
    mCanvasStore = lcanvas;
    recording = lrecording;
    currentPage = 1;
    recordingTime = 0;
    currentStyle = [[ScribbleStyle alloc]init];
    defaultBackground = lbackground;
    return self;
}
- (void) newNotesPage
{
    NotesTextPage* temp = [[NotesTextPage alloc]init:[mNotesStore getPages] Background:defaultBackground];
    
    [mNotesStore newNotesPage:temp]:
}
- (void) newCanvasPage
{
    NotesCanvasPage* temp = [[NotesCanvasPage alloc]init:[mCanvasStore getPages] Background:defaultBackground];

    [mCanvasStore newNotesPage:temp]:
}
- (void) newStyle:(ScribbleStyle *)style
{
    currentStyle = style;
}
- (void) newEvent:(id) event
{
    [mNotesStore addEvent:event page:currentPage];
}

- (void) nextPage
{
    currentPage++;
}
- (void) previousPage
{
    currentPage--;
}
- (void) deletePage
{
    
}
- (void) pauseRecording
{
    [recording stop];
}
- (void) stopRecording
{
    [self save];
    [recording stop];
}
- (void) playRecording
{
    [recording play];
}

- (void) save
{
    NSString *lString = [mNotesStore save];
    NSString *lString2 = [mCanvasStore save];
    
    NSString *lString3 = [lString stringByAppendingString:lString2];
    
    SaveLocal *save = [[SaveLocal alloc]init];
    
    NSData* data = [lString3 dataUsingEncoding:NSUTF8StringEncoding];
    [save write:data];
}

@end
