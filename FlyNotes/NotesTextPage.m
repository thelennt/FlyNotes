//
//  NotesTextPage.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "NotesTextPage.h"
#import "XMLWriter.h"
#import "TextNoteEvent.h"

@implementation NotesTextPage
@synthesize type;
@synthesize number;
@synthesize background;
@synthesize events;
@synthesize dimensions;

-(id)init: (NSUInteger)anumber Background:(NSURL*)abackground
{
    type = @"NotesTextPage";
    number = anumber;
    background = abackground;
    

    return self;
}

- (id)init:(NSDictionary*)dictionary
{
    type = @"NotesTextPage";
    number = [dictionary[@"number"] intValue];
    background = dictionary[@"background"];
    return self;
}

-(BOOL)changeBackground:(NSURL*)abackground
{
    background = abackground;
    return true;
    
}
-(BOOL)addEvent:(TextNoteEvent*)aevent
{
    [events addObject:aevent];
    return true;
}

-(TextNoteEvent*)getEvent:(NSUInteger)event
{
    if(event< [events count])
    {
        return [events objectAtIndex: event];
    }
    return nil;
}


-(NSString*) NotesPageNode
{
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:@"NotesTextPage"];
    [writer writeAttribute:@"type" value:type];
    [writer writeAttribute:@"number" value:[NSString stringWithFormat:@"%lu", (unsigned long)number]];
    [writer writeAttribute:@"background" value:background];
    [writer writeAttribute:@"type" value:type];
    [writer write:[self eventNode]];
    [writer writeEndElement];
    return [writer toString];
}

-(NSString*)eventNode
{
    NSMutableString* string = [[NSMutableString alloc] init];
    TextNoteEvent* levent;
    
    for(levent in events)
    {
        [string appendString:[levent noteEventNode]];
    }
    return string;
}


@end
