//
//  NotesStore.m
//  FlyNotes
//
//  Created by Nathan Thelen on 6/14/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import "NotesStore.h"

@implementation NotesStore

- (id) init
{
    notes = [[NSMutableArray alloc] init];
}
- (void) newNotesPage:(NotesPage*)page
{
    [notes addObject:page];

}
- (NotesPage*) getNotesPage:(NSUInteger)page
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

- (void) addEvent:(NoteEvent*)note page:(NSUInteger)page
{
    [[notes objectAtIndex:page] addTextEvent:note];
}

@end