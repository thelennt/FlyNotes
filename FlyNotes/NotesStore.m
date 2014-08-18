//
//  NotesStore.m
//  FlyNotes
//
//  Created by Nathan Thelen on 6/14/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "NotesStore.h"
#import "NotesPage.h"
#import "NotesTextPage.h"

@implementation NotesStore

- (id) init
{
    notes = [[NSMutableArray alloc] init];
    return self;
}

- (void) newNotesPage:(id)page
{
    if([page conformsToProtocol:@protocol(NotesPage)])
    {
        [notes addObject:page];
    }
}
    
- (NSObject*) getNotesPage:(NSUInteger)page
{
    return [notes objectAtIndex:page];
   
}
    
- (void) removeNotesPage:(NSUInteger)page
{
    return [notes removeObjectAtIndex:page];
    
}

- (NSUInteger) getPages
{
    return [notes count];
}

- (void) addEvent:(id)note page:(NSUInteger)page
{
    if([note conformsToProtocol:@protocol(NotesPage)])
    {
        id <NotesPage> temp = note;
        if([temp.type isEqualToString:@"TextNote"])
            [[notes objectAtIndex:page] addTextEvent:(TextNoteEvent*)note] ;
        if([temp.type isEqualToString:@"ScribbleNote"])
            [[notes objectAtIndex:page] addTextEvent:(TextNoteEvent*)note] ;
    }
}

- (NSString*) save
{
    NSMutableString *lString = [[NSMutableString alloc]init];
    
    for(id note in notes)
    {
        if([note conformsToProtocol:@protocol(NotesPage)])
        {
            id <NotesPage> temp = note;
            [lString appendString: [temp NotesPageNode]];
        }
    }
    return lString;
}

- (NSString*) saveImage
{
        
}


@end