//
//  TextNoteEvent.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "TextNoteEvent.h"
#import "XMLWriter.h"

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
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:type];
    [writer writeAttribute:@"location" value:[location stringValue]];
    [writer writeAttribute:@"style" value:[[style identifier] stringValue]];
    [writer writeAttribute:@"objectid" value:[objectid stringValue]];
    [writer writeAttribute:@"timeStamp" value:[timeStamp stringValue]];
    [writer writeAttribute:@"text" value:charText];
    
    [writer writeEndElement];
    return [writer toString];
}

-(void)addText:(NSString*)acharText
{
    [charText appendString:acharText];
    return;
}
@end
