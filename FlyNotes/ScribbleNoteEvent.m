//
//  ScribbleNoteEvent.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "ScribbleNoteEvent.h"

@interface ScribbleNoteEvent()
@property (readwrite) NSNumber* objectid;
@property (readwrite) NSString* type;
@property (readwrite) NSNumber* timeStamp;
@property (readwrite) ScribbleStyle* style;
@end

@implementation ScribbleNoteEvent
@synthesize objectid;
@synthesize type;
@synthesize timeStamp;
@synthesize style;

-(id)init: (NSNumber*)aid TimeStamp:(NSNumber*)atimeStamp Style:(ScribbleStyle*)astyle
{
    self.objectid = aid;
    self.timeStamp = atimeStamp;
    self.style = astyle;
    self.type = @"Scribble";
}

@end
