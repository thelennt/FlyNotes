//
//  NotesStore.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/14/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesPage.h"
#import "NoteEvent.h"

@interface NotesStore : NSObject
{
    NSMutableArray* notes;
    NSMutableArray* styles;
    
}

- (id) init;
- (void) newNotesPage:(id)notepage;
- (NSObject*) getNotesPage:(NSUInteger)page;
- (void) removeNotesPage:(NSUInteger)page;
- (NSUInteger) getPages;
- (NSString*) save;
- (void) addEvent:(id)note page:(NSUInteger)page;
- (void) addStyle:(id)style;
- (UIImage*) getBackground:(NSUInteger) currentPage;
@end
