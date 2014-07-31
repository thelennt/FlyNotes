//
//  NotesParser.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "NotesParser.h"
#import "Stack.h"
#import "ScribbleNoteEvent.h"
#import "TextNoteEvent.h"
#import "NotesTextPage.h"
#import "NotesScribblePage.h"
#import "ScribbleStyle.h"
#import "NoteStyle.h"


@implementation NotesParser

Stack *elementStack;
NSXMLParser *parser;

@synthesize notes;

- (void)parseXMLFile:(NSString *)pathToFile
{
    elementStack = [[Stack alloc]init];
    
    BOOL success;
    NSURL *xmlURL = [NSURL fileURLWithPath:pathToFile];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:YES];
    success = [parser parse]; // return value not used
    // if not successful, delegate is informed of error
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [elementStack push:elementName];
    if ( [elementName isEqualToString:@"ScribbleNoteEvent"])
    {
        ScribbleNoteEvent *event = [[ScribbleNoteEvent alloc] init: attributeDict];
        return;
    }
    
    if ( [elementName isEqualToString:@"TextNoteEvent"] )
    {
        TextNoteEvent *event = [[TextNoteEvent alloc] init: attributeDict];
        return;
    }
    
    if ( [elementName isEqualToString:@"NotesTextPage"] )
    {
        NotesTextPage *event = [[NotesTextPage alloc] init: attributeDict];
        return;
    }
    
    if ( [elementName isEqualToString:@"NotesScribblePage"] )
    {
        NotesScribblePage *event = [[NotesScribblePage alloc] init: attributeDict];
        return;
    }
    
    if ( [elementName isEqualToString:@"ScribbleStyle"] )
    {
        ScribbleStyle *event = [[ScribbleStyle alloc] init: attributeDict];
        return;
    }
    
    if ( [elementName isEqualToString:@"NoteStyle"] )
    {
        NoteStyle *event = [[NoteStyle alloc] init: attributeDict];
        return;
    }

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [elementStack pop];
    // ignore root and empty elements
        return;
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{

}


@end
