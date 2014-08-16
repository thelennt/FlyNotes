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
    NSNumber* objectid;
    NSString* type;
    NSNumber* timeStamp;
    NSMutableArray* locations;
    NSUInteger x;
    NSUInteger y;
    ScribbleStyle* style;
}

-(id)init: (NSNumber*)aid TimeStamp:(NSNumber*)atimeStamp Style:(ScribbleStyle*)astyle x:(NSNumber*)lx t:(NSNumber*)ly;

- (id)init:(NSDictionary*)dictionary;

@property (readonly) ScribbleStyle* style;
@property (readonly) NSNumber* objectid;
@property (readonly) NSString* type;
@property (readonly) NSNumber* timeStamp;
@property (readonly) NSString* noteEventNode;
@property (readonly) NSUInteger x;
@property (readonly) NSUInteger y;

@end
