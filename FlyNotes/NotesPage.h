//
//  NotesPage.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NotesPage <NSObject>

@property (readonly) NSString* type;
@property (readonly) NSNumber* number;
@property (readonly) (NSFile*) background
@property (readonly) (NSArray*) events;

-(id)init: (NSString*)atype PageNumber:(NSNumber*)anumber Background:(NSFile*)abackground;
-(BOOL)changeBackground:(NSFile*)abackground;
-(BOOL)addEvent:(NoteEvent*)aevent;
-(NSXMLElement*)outputNotesPageNode();


@end
