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
@synthesize backgroundImage;

-(id)init: (NSUInteger)anumber Background:(NSURL*)abackground
{
    type = @"NotesScribblePage";
    number = anumber;
    background = abackground;
    
    xEvents = [[NSMutableDictionary alloc]init];
    yEvents = [[NSMutableDictionary alloc]init];
    timeEvents = [[NSMutableDictionary alloc]init];
    NSError* error;
    
    NSData *imageData =[[NSData alloc] initWithContentsOfURL:background options:NSDataWritingAtomic error:&error];
    if(!imageData)
    {
        if ( error )
            NSLog( @"error = %@", [error description] );
        return nil;
    }
    backgroundImage = [[UIImage alloc] initWithData:imageData];
    
    
    return self;
}

- (id)init:(NSDictionary*)dictionary
{
    type = @"NotesScribblePage";
    number = [dictionary[@"number"] intValue];;
    background = dictionary[@"background"];
    NSData *imageData = [[NSData alloc] initWithContentsOfFile:[background absoluteString]];
    backgroundImage = [[UIImage alloc] initWithData:imageData];
    return self;
}

-(BOOL)changeBackground:(NSURL*)abackground
{
    background = abackground;
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:background];
    backgroundImage = [[UIImage alloc] initWithData:imageData];
    return true;
}
-(BOOL)addEvent:(ScribbleNoteEvent*)aevent
{
    [events addObject:aevent];
    [timeEvents setObject:aevent forKey:[NSNumber numberWithInt:[aevent timeStamp]]];
    [xEvents setObject:aevent forKey:[NSNumber numberWithInt:[aevent x]]];
    [yEvents setObject:aevent forKey:[NSNumber numberWithInt:[aevent y]]];
    return true;
}

-(NSArray*)getTimeEvents:(int)value span:(int)span
{
    NSMutableArray* temp;
    temp = [[NSMutableArray alloc]init];
    for(int i=value-span;i<value+span;i++)
    {
        NSNumber *tnumber = [NSNumber numberWithInt:i];
        if(timeEvents[tnumber] != nil)
        {
            [temp addObject:timeEvents[tnumber]];
        }
    }
    return temp;
}

-(NSArray*)getLocationEvents:(NSUInteger)x y:(NSUInteger)y span:(NSUInteger)span
{
    NSMutableSet* xSet = [[NSMutableSet alloc]init];
    NSMutableSet* ySet = [[NSMutableSet alloc]init];

    for(NSUInteger i=x-span;i<x+span;i++)
    {
        NSNumber *tnumber = [NSNumber numberWithInt:i];
        if(xEvents[tnumber] != nil)
        {
            [xSet addObject:xEvents[tnumber]];
        }
    }
    
    for(int i=y-span;i<y+span;i++)
    {
        NSNumber *tnumber = [NSNumber numberWithInt:i];
        if(yEvents[tnumber] != nil)
        {
            [ySet addObject:yEvents[tnumber]];
        }
    }
    
    [xSet intersectSet:(NSSet *)ySet];
    
    NSArray *array = [xSet allObjects];
    return array;
}

-(ScribbleNoteEvent*)getNearestEvent:(NSUInteger)x y:(NSUInteger)y span:(NSUInteger)span
{
    ScribbleNoteEvent* temp = nil;
    
    NSUInteger tempx;
    NSUInteger tempy;
    float tempclosest;
    float closest = 99999;
    
    NSArray* array = [self getLocationEvents:(NSUInteger)x y:(NSUInteger)y span:(NSUInteger)span];
    
    for(ScribbleNoteEvent* s in array)
    {
        tempx = abs([s x] - x);
        tempy = abs([s y] - y);
        
        tempclosest = sqrt(tempx*tempx + tempy*tempy);
        if( tempclosest < closest)
        {
            closest = tempclosest;
            temp = s;
        }
    }
    return temp;
}


-(NSString*) NotesPageNode
{
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:@"NotesScribblePage"];
    [writer writeAttribute:@"type" value:type];
    [writer writeAttribute:@"number" value:[NSString stringWithFormat:@"%lu", (unsigned long)number]];

    [writer writeAttribute:@"background" value:[[NSString alloc] initWithString:[background path]]];
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
