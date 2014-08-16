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
    NSNumber* number;
    NSString* background;
    NSMutableArray* events;
    CGPoint* dimensions;
}

-(id)init: (NSString*)atype PageNumber:(NSNumber*)anumber Background:(NSString*)abackground;
-(BOOL)changeBackground:(NSString*)abackground;
-(BOOL)addEvent:(TextNoteEvent*)aevent;

@property (readonly) NSString* type;
@property (readonly) NSNumber* number;
@property (readonly) NSString* background;
@property (readonly) NSMutableArray* events;
@property (readonly) NSString* NotesPageNode;

- (id)init:(NSDictionary*)dictionary;
@end
