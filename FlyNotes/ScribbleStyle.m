//
//  ScribbleStyle.m
//  FlyNotes
//
//  Created by Nathan Thelen on 6/3/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "ScribbleStyle.h"
#import "Style.h"
#import "XMLWriter.h"

@implementation ScribbleStyle
@synthesize type;
@synthesize identifier;
@synthesize color;
@synthesize depth;

- (id)init:(NSNumber*)aid color:(NSString*)acolor depth:(NSNumber*)adepth
{
    type = @"ScribbleStyle";
    color = acolor;
    depth = adepth;
    identifier = aid;
    return self;
}

- (id)init:(NSDictionary*)dictionary
{
    
    type = @"ScribbleStyle";
    color = dictionary[@"color"];;
    depth = dictionary[@"depth"];;
    identifier = dictionary[@"identifier"];;
    return self;
}

- (NSString*) styleNode
{
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:type];
    [writer writeAttribute:@"color" value:color];
    [writer writeAttribute:@"depth" value:[depth stringValue]];
    [writer writeAttribute:@"identifier" value:[identifier stringValue]];
    [writer writeAttribute:@"type" value:type]; 
    [writer writeEndElement];

    return [writer toString];
}


@end
