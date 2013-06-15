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
@property XMLWriter* writer;
-(NSString*)locationNode;
@end

@implementation ScribbleNoteEvent
@synthesize objectid;
@synthesize type;
@synthesize timeStamp;
@synthesize style;
@synthesize locations;

-(id)init: (NSNumber*)aid TimeStamp:(NSNumber*)atimeStamp Style:(ScribbleStyle*)astyle
{
    objectid = aid;
    timeStamp = atimeStamp;
    style = astyle;
    type = @"ScribbleNote";
    
    return self;
}

-(NSString*) noteEventNode
{
    writer = [[XMLWriter alloc] init];

    [writer writeStartElement:@"ScibbleNoteEvent"];
    [writer writeAttribute:@"style" value:[[style identifier] stringValue]];
    [writer writeAttribute:@"objectid" value:[objectid stringValue]];
    [writer writeAttribute:@"type" value:type];
    [writer writeAttribute:@"timeStamp" value:[timeStamp stringValue]];
    [writer writeAttribute:@"location" value:[location stringValue]];
    [locationNode];
    [writer writeEndElement];
    
    return [writer toString];
}

-(NSString*)locationNode
{
    CGPoint point;
    for(point in locations)
    {
        [writer writeStartElement:@"Point"];
        [writer writeAttribute:@"x" value:[[point x]]];
        [writer writeAttribute:@"y" value:[[point y]]];
        [writer writeEndElement];
    }
    return [writer toString];
}

-(void)addText:(NSString*)acharText
{
    [charText appendString:acharText];
    return;
}

-(
@end
