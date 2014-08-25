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
    ScribbleStyle* style;
}

-(id)init: (NSUInteger)aid TimeStamp:(NSUInteger)atimeStamp Style:(ScribbleStyle*)astyle x:(NSUInteger)lx t:(NSUInteger)ly;

- (id)init:(NSDictionary*)dictionary;

@property (readonly) ScribbleStyle* style;
@property (readonly) NSUInteger objectid;
@property (readonly) NSString* eventType;
@property (readonly) NSUInteger timeStamp;
@property (readonly) NSString* noteEventNode;
@property (readonly) NSUInteger x;
@property (readonly) NSUInteger y;

@end
