//
//  NotesParser.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "NotesParser.h"
#import "Stack.h"

@implementation NotesParser

Stack *elementStack;

- (void)parseXMLFile:(NSString *)pathToFile
{
    elementStack = [[Stack alloc]init];
    
    BOOL success;
    NSURL *xmlURL = [NSURL fileURLWithPath:pathToFile];
    if (_parser) // addressParser is an NSXMLParser instance variable
        [_parser release];
    _parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [_parser setDelegate:self];
    [_parser setShouldResolveExternalEntities:YES];
    success = [_parser parse]; // return value not used
    // if not successful, delegate is informed of error
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{

        [elementStack push:elementName];
    if ( [elementName isEqualToString:@"ScribbleNoteEvent"])
    {

        return;
    }
    
    if ( [elementName isEqualToString:@"TextNoteEvent"] )
    {

        return;
    }
    
    if ( [elementName isEqualToString:@"NotesTextPage"] )
    {

        return;
    }
    
    if ( [elementName isEqualToString:@"NotesScribblePage"] )
    {
        
        return;
    }
    
    if ( [elementName isEqualToString:@"ScribbleStyle"] )
    {
        
        return;
    }
    
    if ( [elementName isEqualToString:@"NoteStyle"] )
    {
        
        return;
    }
    
    if ( [elementName isEqualToString:@"addresses"]) {
        // addresses is an NSMutableArray instance variable
        if (!addresses)
            addresses = [[NSMutableArray alloc] init];
        NSString *thisOwner = [attributeDict objectForKey:@"owner"];
        if (thisOwner)
            [self setOwner:thisOwner forAddresses:addresses];
        return;
        // ... continued ...
    
    }    // .... continued for remaining elements ....
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [elementStack pop];
    // ignore root and empty elements
    if (( [elementName isEqualToString:@"addresses"]) ||
        ( [elementName isEqualToString:@"address"] )) return;
    
    if ( [elementName isEqualToString:@"person"] ) {
        // addresses and currentPerson are instance variables
        [addresses addObject:currentPerson];
        [currentPerson release];
        return;
    }
    NSString *prop = [self currentProperty];
    
    // ... here ABMultiValue objects are dealt with ...
    
    if (( [prop isEqualToString:kABLastNameProperty] ) ||
        ( [prop isEqualToString:kABFirstNameProperty] )) {
        [currentPerson setValue:(id)currentStringValue forProperty:prop];
    }
    // currentStringValue is an instance variable
    [currentStringValue release];
    currentStringValue = nil;
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (!currentStringValue) {
        // currentStringValue is an NSMutableString instance variable
        currentStringValue = [[NSMutableString alloc] initWithCapacity:50];
    }
    [currentStringValue appendString:string];
}


@end
