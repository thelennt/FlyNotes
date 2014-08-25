//
//  TextNoteEvent.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteEvent.h"
#import "NoteStyle.h"

@interface TextNoteEvent : NSObject <NoteEvent>
{
@protected
    NSUInteger objectid;
    NSString* eventType;
    NSUInteger timeStamp;
    NSMutableString* charText;
    NSUInteger location;
    NoteStyle* style;
}

-(id)init: (NSUInteger)aid TimeStamp:(NSUInteger) atimeStamp Style:(NoteStyle*)astyle Location:(NSUInteger)alocation;
-(void)addText:(NSString*)charText;
- (id)init:(NSDictionary*)dictionary;


@property (readonly) NSMutableString* charText;
@property (readonly) NSUInteger location;
@property (readonly) NoteStyle* style;
@property (readonly) NSUInteger objectid;
@property (readonly) NSString* eventType;
@property (readonly) NSUInteger timeStamp;
@property (readonly) NSString* noteEventNode;

@end
