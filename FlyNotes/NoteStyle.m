//
//  NoteStyle.m
//  FlyNotes
//
//  Created by Nathan Thelen on 6/3/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "NoteStyle.h"
#import "XMLWriter.h"

@implementation NoteStyle
@synthesize type;
@synthesize identifier;
@synthesize bold;
@synthesize italic;
@synthesize underline;
@synthesize font;

- (id)init:(NSNumber*)aid bold:(NSNumber*)abold italic:(NSNumber*)aitalic underline:(NSNumber*)aunderline font:(NSString*)afont
{
    type = @"NoteStyle";
    identifier = aid;
    bold = abold;
    italic = aid;
    underline = aunderline;
    font = afont;
    return self;
}

- (id)init:(NSDictionary*)dictionary
{
    type = @"NoteStyle";
    identifier = dictionary[@"identifier"];
    bold = dictionary[@"bold"];
    italic = dictionary[@"italic"];
    underline = dictionary[@"underline"];
    font = dictionary[@"font"];
    return self;
}

- (NSString*) styleNode
{
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:type];
    [writer writeAttribute:@"identifier" value:[identifier stringValue]];
    [writer writeAttribute:@"bold" value:[bold stringValue]];
    [writer writeAttribute:@"italic" value:[italic stringValue]];
    [writer writeAttribute:@"underline" value:[underline stringValue]];
    [writer writeAttribute:@"font" value:font];
    [writer writeEndElement];
    return [writer toString];
}
@end
