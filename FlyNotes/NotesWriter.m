//
//  NotesWriter.m
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "NotesWriter.h"

@implementation NotesWriter

- (void)createXMLDocumentFromFile:(NSString *)file
{
    /*
    NSXMLDocument *xmlDoc;
    NSError *err=nil;
    NSURL *furl = [NSURL fileURLWithPath:file];
    if (!furl) {
        NSLog(@"Can't create an URL from file %@.", file);
        return;
    }
    xmlDoc = [[NSXMLDocument alloc] initWithContentsOfURL:furl
                                                  options:(NSXMLNodePreserveWhitespace|NSXMLNodePreserveCDATA)
                                                    error:&err];
    if (xmlDoc == nil) {
        xmlDoc = [[NSXMLDocument alloc] initWithContentsOfURL:furl
                                                      options:NSXMLDocumentTidyXML
                                                        error:&err];
    }
    if (xmlDoc == nil)  {
        if (err) {
            [self handleError:err];
        }
        return;
    }
    
    if (err) {
        [self handleError:err];
    }
     */
}

- (void)createXMLDocumentFromFile
{
    /*
    NSXMLElement *client_state = [[NSXMLElement alloc] initWithName:@"client_state"];
    
    NSXMLElement *platform = [[NSXMLElement alloc] initWithName:@"platform"];
    [platform setStringValue:@"******PLATFORMNAME*******"];
    [client_state addChild:platform];
    [platform release];
    
    NSXMLElement *OS_version = [[NSXMLElement alloc] initWithName:@"OS_version"];
    [OS_version setStringValue:@"********OS VERSION*******"];
    [client_state addChild:OS_version];
    [OS_version release];
    
    NSXMLElement *root =
    (NSXMLElement *)[NSXMLNode elementWithName:@"addresses"];
    NSXMLDocument *xmlDoc = [[NSXMLDocument alloc] initWithRootElement:root];
    [xmlDoc setVersion:@"1.0"];
    [xmlDoc setCharacterEncoding:@"UTF-8"];
    [root addChild:[NSXMLNode commentWithStringValue:@"Hello world!"]];
     */
}

@end
