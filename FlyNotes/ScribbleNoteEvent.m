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
@synthesize type;
@synthesize timeStamp;
@synthesize style;
@synthesize locations;

XMLWriter* writer;
-(id)init: (NSNumber*)aid TimeStamp:(NSNumber*)atimeStamp Style:(ScribbleStyle*)astyle{
    objectid = aid;
    timeStamp = atimeStamp;
    style = astyle;
    type = @"ScribbleNote";
    locations = [[NSMutableArray alloc] init];
    
    return self;
}


- (id)init:(NSDictionary*)dictionary
{
    objectid = dictionary[@"objectid"];
    timeStamp = dictionary[@"timeStamp"];
    style = dictionary[@"style"];
    type = @"ScribbleNote";
    locations = [[NSMutableArray alloc] init];
    return self;
}

-(NSString*) noteEventNode
{
    writer = [[XMLWriter alloc] init];

    [writer writeStartElement:type];
    [writer writeAttribute:@"style" value:[[style identifier] stringValue]];
    [writer writeAttribute:@"objectid" value:[objectid stringValue]];
    [writer writeAttribute:@"timeStamp" value:[timeStamp stringValue]];
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

-(void)addPoint:(CGPoint*)apoint
{
    [locations addObject:(__bridge id)apoint];
    
}

@end
