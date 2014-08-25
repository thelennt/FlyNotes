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
#import "ScribbleNoteEvent.h"
#import "TextNoteEvent.h"

@implementation RecordModeEventHandler

- (id) init:(NotesStore*)lstore canvasStore:(NotesStore*)lcanvas recording:(id)lrecording background:(NSString*)lbackground
{
    mNotesStore = lstore;
    mCanvasStore = lcanvas;
    recording = lrecording;
    currentPage = 1;
    recordingTime = 0;
    defaultBackground = lbackground;
    currentStyle = [[ScribbleStyle alloc]init:0 color:@"Blue" depth:5];
    StyleCount = 1;
    NoteStyleCount=1;
    return self;
}
- (void) newNotesPage
{
    NotesTextPage* tempValue = [[NotesTextPage alloc] init:[mNotesStore getPages] Background:defaultBackground];
    
    [mNotesStore newNotesPage:tempValue];
}
- (void) newCanvasPage
{
    NotesScribblePage* tempValue = [[NotesScribblePage alloc] init:[mCanvasStore getPages] Background:defaultBackground];

    [mCanvasStore newNotesPage:tempValue];
}
- (void) newCanvasStyle:(ScribbleStyle *)style
{
    currentStyle = style;
    StyleCount++;
}
- (void) newNoteStyle:(ScribbleStyle *)style
{
    currentNoteStyle = style;
    NoteStyleCount++;
}
- (void) newEvent:(id) event
{
    if([event conformsToProtocol:@protocol(NoteEvent)] && [[event eventType] isEqualToString:@"ScribbleNoteEvent"])
    {
        [mCanvasStore addEvent:event page:currentPage];
    }
    if([event conformsToProtocol:@protocol(NoteEvent)] && [[event eventType] isEqualToString:@"TextNoteEvent"])
    {
        [mNotesStore addEvent:event page:currentPage];
    }
}

- (void) nextPage
{
    if(currentPage < [mCanvasStore getPages])
        currentPage++;
}
- (void) previousPage
{
    if(currentPage > 1)
        currentPage--;
}
- (void) deletePage
{
    [mCanvasStore removeNotesPage:currentPage];
    currentPage--;
}
- (void) pauseRecording
{
    if([recording state] == STOPPED)
        [recording stop];
}
- (void) stopRecording
{
    if([recording state] == PLAYING)
    {
        [self save];
        [recording stop];
    }
}
- (void) playRecording
{
    if([recording state] == STOPPED)
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
