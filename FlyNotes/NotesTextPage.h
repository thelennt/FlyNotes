//
//  NotesTextPage.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/5/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "NotesPage.h"
#import "NoteEvent.h"

@interface NotesTextPage : NSObject <NotesPage>
{
@protected
    
    NSString* type;
    NSUInteger number;
    NSURL* background;
    NSMutableArray* events;
    CGPoint* dimensions;
}

-(id)init: (NSUInteger)anumber Background:(NSURL*)abackground;
-(BOOL)changeBackground:(NSURL*)abackground;
-(BOOL)addEvent:(TextNoteEvent*)aevent;

@property (readonly) NSString* type;
@property (readonly) NSUInteger number;
@property (readonly) NSURL* background;
@property (readonly) NSMutableArray* events;
@property (readonly) NSString* NotesPageNode;

- (id)init:(NSDictionary*)dictionary;
@end
