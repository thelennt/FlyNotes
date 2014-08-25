//
//  ScribbleNoteEvent.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "ScribbleNoteEvent.h"
#import "XMLWriter.h"

@implementation ScribbleNoteEvent
@synthesize objectid;
@synthesize eventType;
@synthesize timeStamp;
@synthesize style;
@synthesize x;
@synthesize y;


XMLWriter* writer;
-(id)init: (NSUInteger)aid TimeStamp:(NSUInteger)atimeStamp Style:(ScribbleStyle*)astyle x:(NSUInteger)lx t:(NSUInteger)ly
{
    objectid = aid;
    timeStamp = atimeStamp;
    style = astyle;
    eventType = @"ScribbleNote";
    x = lx;
    y = ly;
    
    return self;
}


- (id)init:(NSDictionary*)dictionary
{
    x = [dictionary[@"x"] intValue];
    y = [dictionary[@"y"] intValue];
    objectid = [dictionary[@"objectid"] intValue];
    timeStamp = [dictionary[@"timeStamp"] intValue];
    style = dictionary[@"style"];
    eventType = @"ScribbleNote";

    return self;
}

-(NSString*) noteEventNode
{
    writer = [[XMLWriter alloc] init];

    [writer writeStartElement:eventType];
    [writer writeAttribute:@"style" value:[NSString stringWithFormat:@"%lu", (unsigned long)[style identifier]]];
    [writer writeAttribute:@"objectid" value:[NSString stringWithFormat:@"%lu", (unsigned long)objectid]];
    [writer writeAttribute:@"timeStamp" value:[NSString stringWithFormat:@"%lu", (unsigned long)timeStamp]];
    //[writer writeAttribute:@"location" value:[location stringValue]];
    [writer write:[self locationNode]];
    [writer writeEndElement];
    
    return [writer toString];
}

-(NSString*)locationNode
{
    CGPoint* point;
    for(id loc in locations)
    {
        point = (__bridge CGPoint*)loc;
        [writer writeStartElement:@"Point"];
        [writer writeAttribute:@"x" value:[[NSNumber numberWithFloat:point->x] stringValue]];
        [writer writeAttribute:@"y" value:[[NSNumber numberWithFloat:point->y] stringValue]];
        [writer writeEndElement];
    }
    return [writer toString];
}


@end
