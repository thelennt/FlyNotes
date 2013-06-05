//
//  TextNoteEvent.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteEvent.h"
#import "NoteStyle.h"

@interface TextNoteEvent : NSObject <NoteEvent>

-(id)init: (NSNumber*)id TimeStamp:(NSNumber*)atimeStamp Style:(NoteStyle*)astyle Location:(NSNumber*)alocation;
-(void)addText:(NSString*)charText;

@property (readonly) NSMutableString* charText;
@property (readonly) NSNumber* location;
@property (readonly) NoteStyle* style;


@end
