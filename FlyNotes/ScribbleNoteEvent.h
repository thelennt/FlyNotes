//
//  ScribbleNoteEvent.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScribbleStyle.h"
#import <UIKit/UIKit.h>
#import "NoteEvent.h"
#import "NoteStyle.h"

@interface ScribbleNoteEvent : NSObject <NoteEvent>
{
@protected
    NSUInteger objectid;
    NSString* eventType;
    NSUInteger timeStamp;
    NSMutableArray* locations;
    NSUInteger x;
    NSUInteger y;
    NSUInteger style;
    bool newSelect;
}

-(id)init: (NSUInteger)aid TimeStamp:(NSTimeInterval)atimeStamp Style:(NSUInteger)astyle x:(NSUInteger)lx y:(NSUInteger)ly newSelect:(bool)anew;

- (id)init:(NSDictionary*)dictionary;

@property (readonly) NSUInteger style;
@property (readonly) NSUInteger objectid;
@property (readonly) NSString* eventType;
@property (readonly) NSUInteger timeStamp;
@property (readonly) NSString* noteEventNode;
@property (readonly) NSUInteger x;
@property (readonly) NSUInteger y;
@property (readonly) bool newSelect;

@end
