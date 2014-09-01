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
@synthesize newSelect;



XMLWriter* writer;
-(id)init: (NSUInteger)aid TimeStamp:(NSTimeInterval)atimeStamp Style:(NSUInteger)astyle x:(NSUInteger)lx y:(NSUInteger)ly newSelect:(bool)anew
{
    objectid = aid;
    timeStamp = atimeStamp;
    style = astyle;
    eventType = @"ScribbleNote";
    x = lx;
    y = ly;
    newSelect = anew;
    
    return self;
}


- (id)init:(NSDictionary*)dictionary
{
    x = [dictionary[@"x"] intValue];
    y = [dictionary[@"y"] intValue];
    newSelect = [dictionary[@"x"] intValue];
    objectid = [dictionary[@"objectid"] intValue];
    timeStamp = [dictionary[@"timeStamp"] intValue];
    style = [dictionary[@"style"] intValue];
    eventType = @"ScribbleNote";

    return self;
}

-(NSString*) noteEventNode
{
    writer = [[XMLWriter alloc] init];

    [writer writeStartElement:eventType];
    [writer writeAttribute:@"style" value:[NSString stringWithFormat:@"%lu", (unsigned long)style]];
    [writer writeAttribute:@"objectid" value:[NSString stringWithFormat:@"%lu", (unsigned long)objectid]];
    [writer writeAttribute:@"timeStamp" value:[NSString stringWithFormat:@"%lu", (unsigned long)timeStamp]];
        [writer writeAttribute:@"new" value:[NSString stringWithFormat:@"%lu", (unsigned long)newSelect]];
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
