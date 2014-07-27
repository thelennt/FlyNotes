//
//  NotesScribblePage.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "NotesScribblePage.h"
#import "ScribbleNoteEvent.h"
#import "XMLWriter.h"

@implementation NotesScribblePage
@synthesize type;
@synthesize number;
@synthesize background;
@synthesize events;
@synthesize dimensions;

-(id)init: (NSString*)atype PageNumber:(NSNumber*)anumber Background:(NSString*)abackground
{
    type = @"NotesScribblePage";
    number = anumber;
    background = abackground;
    return self;
}

- (id)init:(NSDictionary*)dictionary
{
    type = @"NotesScribblePage";
    number = dictionary[@"number"];
    background = dictionary[@"background"];
    return self;
}

-(BOOL)changeBackground:(NSString*)abackground
{
    background = abackground;
    return true;
}
-(BOOL)addEvent:(ScribbleNoteEvent*)aevent
{
    [events addObject:aevent];
    return true;
}


-(NSString*) NotesPageNode
{
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:@"NotesScribblePage"];
    [writer writeAttribute:@"type" value:type];
    [writer writeAttribute:@"number" value:[number stringValue]];
    [writer writeAttribute:@"background" value:background];
    [writer writeAttribute:@"type" value:type];
    [writer write:[self eventNode]];
    [writer writeEndElement];
    return [writer toString];
}

-(NSString*)eventNode
{
    NSMutableString* string = [[NSMutableString alloc] init];
    ScribbleNoteEvent* levent;
    
    for(levent in events)
    {
        [string appendString:[levent noteEventNode]];
    }
    return string;
}
@end
