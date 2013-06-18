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
    type = @"NotesTextPage";
    number = anumber;
    background = abackground;
}
-(BOOL)changeBackground:(NSString*)abackground
{
    background = abackground;
    
}
-(BOOL)addEvent:(ScribbleNoteEvent*)aevent
{
    [events addObject:aevent];
}


-(NSString*) NotesPageNode
{
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:@"TextNoteEvent"];
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
