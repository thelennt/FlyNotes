//
//  NotesPage.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteEvent.h"
#import "ScribbleNoteEvent.h"
#import "TextNoteEvent.h"

@protocol NotesPage <NSObject>

@property (readonly) NSString* type;
@property (readonly) NSUInteger number;
@property (readonly) NSURL* background;
@property (readonly) NSMutableArray* events;
@property (readonly) NSString* NotesPageNode;
@property (readonly) CGPoint* dimensions;

-(id)init: (NSUInteger)anumber Background:(NSString*)abackground;
-(BOOL)changeBackground:(NSString*)abackground;
- (id)init:(NSDictionary*)dictionary;
-(NSString*) NotesPageNode;

@optional
-(BOOL)addScribbleEvent:(ScribbleNoteEvent*)aevent;
-(BOOL)addTextEvent:(TextNoteEvent*)aevent;

@end
