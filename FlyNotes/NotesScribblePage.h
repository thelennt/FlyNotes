//
//  NotesScribblePage.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/5/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "NotesPage.h"

@interface NotesScribblePage : NSObject <NotesPage>
{
    @protected
    NSString* type;
    NSUInteger number;
    NSURL* background;
    NSMutableArray* events;
    CGPoint* dimensions;
    
    NSMutableDictionary* xEvents;
    NSMutableDictionary* yEvents;
    NSMutableDictionary* timeEvents;
    
    UIImage* backgroundImage;
}
-(id)init: (NSUInteger)anumber Background:(NSURL*)abackground;
- (id)init:(NSDictionary*)dictionary;

@property (readonly) UIImage* backgroundImage;
@end