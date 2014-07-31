//
//  NotesStore.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/14/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesPage.h"

@interface NotesStore : NSObject
{
    NSMutableArray* notes;
    
}

- (id) init;
- (void) newNotesPage:(NSObject*)page;
- (NSObject*) getNotesPage:(NSUInteger)page;
- (void) removeNotesPage:(NSUInteger)page;
- (NSUInteger) getPages;


@end
