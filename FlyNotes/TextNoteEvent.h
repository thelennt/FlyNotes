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

@property NSString* charText;
@property NSNumber* location;
@property NSNumber* timeStamp;
@property NoteStyle* style;


@end
