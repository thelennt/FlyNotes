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

- (id)init:(NSUInteger)aid bold:(NSUInteger)abold italic:(NSUInteger)aitalic underline:(NSUInteger)aunderline font:(NSString*)afont
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
    identifier = [dictionary[@"identifier"] intValue];
    bold = [dictionary[@"bold"] intValue];
    italic = [dictionary[@"italic"] intValue];
    underline = [dictionary[@"underline"] intValue];
    font = dictionary[@"font"];
    return self;
}

- (NSString*) styleNode
{
    XMLWriter *writer = [[XMLWriter alloc] init];
    
    [writer writeStartElement:type];
    [writer writeAttribute:@"identifier" value:[NSString stringWithFormat:@"%lu", (unsigned long)identifier]];;
    [writer writeAttribute:@"bold" value:[NSString stringWithFormat:@"%lu", (unsigned long)bold]];;
    [writer writeAttribute:@"italic" value:[NSString stringWithFormat:@"%lu", (unsigned long)italic]];;
    [writer writeAttribute:@"underline" value:[NSString stringWithFormat:@"%lu", (unsigned long)underline]];
    [writer writeAttribute:@"font" value:font];
    [writer writeEndElement];
    return [writer toString];
}
@end
