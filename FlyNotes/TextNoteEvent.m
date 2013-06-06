//
//  TextNoteEvent.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "TextNoteEvent.h"

@interface TextNoteEvent()
@property (readwrite) NSNumber* objectid;
@property (readwrite) NSString* type;
@property (readwrite) NSNumber* timeStamp;
@property (readwrite) NoteStyle* style;
@property (readwrite) NSNumber* location;
@end

@implementation TextNoteEvent
@synthesize objectid;
@synthesize type;
@synthesize location;
@synthesize timeStamp;
@synthesize style;

-(id)init: (NSNumber*)aid TimeStamp:(NSNumber*)atimeStamp Style:(NoteStyle*)astyle Location:(NSNumber*)alocation{
    self.objectid = aid;
    self.timeStamp = atimeStamp;
    self.style = astyle;
    self.type = @"Note";
    self.location = alocation;
    return self;
}

@end
