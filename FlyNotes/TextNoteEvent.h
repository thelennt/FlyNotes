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
    NSNumber* objectid;
    NSString* type;
    NSNumber* timeStamp;
    NSMutableString* charText;
    NSNumber* location;
    NoteStyle* style;
}

-(id)init: (NSNumber*)id TimeStamp:(NSNumber*)atimeStamp Style:(NoteStyle*)astyle Location:(NSNumber*)alocation;
-(void)addText:(NSString*)charText;
- (id)init:(NSDictionary*)dictionary

@property (readonly) NSMutableString* charText;
@property (readonly) NSNumber* location;
@property (readonly) NoteStyle* style;
@property (readonly) NSNumber* objectid;
@property (readonly) NSString* type;
@property (readonly) NSNumber* timeStamp;
@property (readonly) NSString* noteEventNode;

@end
