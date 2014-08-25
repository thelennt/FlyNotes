//
//  CanvasStore.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/14/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CanvasStore : NSObject
{
    NSMutableArray* notes;
    
}

- (id) init;
- (void) newNotesPage:(id) notepage;
- (NSObject*) getNotesPage:(NSUInteger)page;
- (void) removeNotesPage:(NSUInteger)page;
- (NSUInteger) getPages;
- (NSString*) save;
- (void) addEvent:(id)note page:(NSUInteger)page;
@end
