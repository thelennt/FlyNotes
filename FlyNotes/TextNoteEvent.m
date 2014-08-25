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
@synthesize eventType;
@synthesize location;
@synthesize timeStamp;
@synthesize style;
@synthesize charText;


-(id)init: (NSUInteger)aid TimeStamp:(NSUInteger) atimeStamp Style:(NoteStyle*)astyle Location:(NSUInteger)alocation
{
    objectid = aid;
    timeStamp = atimeStamp;
    style = astyle;
    eventType = @"TextNote";
    location = alocation;
    return self;
}

- (id)init:(NSDictionary*)dictionary
{
    objectid = [dictionary[@"objectid"] intValue];
    timeStamp = [dictionary[@"timeStamp"] intValue];
    style = dictionary[@"style"];;
    eventType = @"TextNote";
    location = [dictionary[@"location"] intValue];
    return self;
}


-(NSString*) noteEventNode
{
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:eventType];
    [writer writeAttribute:@"location" value:[NSString stringWithFormat:@"%lu", (unsigned long)location]];
    [writer writeAttribute:@"style" value:[NSString stringWithFormat:@"%lu", (unsigned long)[style identifier]]];
    [writer writeAttribute:@"objectid" value:[NSString stringWithFormat:@"%lu", (unsigned long)objectid]];
    [writer writeAttribute:@"timeStamp" value:[NSString stringWithFormat:@"%lu", (unsigned long)timeStamp]];
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
