//
//  TextNoteEvent.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "TextNoteEvent.h"

@implementation TextNoteEvent
@synthesize objectid;
@synthesize type;
@synthesize location;
@synthesize timeStamp;
@synthesize style;
@synthesize charText;


-(id)init: (NSNumber*)aid TimeStamp:(NSNumber*)atimeStamp Style:(NoteStyle*)astyle Location:(NSNumber*)alocation
{
    objectid = aid;
    timeStamp = atimeStamp;
    style = astyle;
    type = @"TextNote";
    location = alocation;
    return self;
}

-(NSString*) noteEventNode
{
    return @"Himom";


}

-(void)addText:(NSString*)charText
{
    return;
}
@end
