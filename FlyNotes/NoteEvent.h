//
//  NoteEvent.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NoteEvent <NSObject>

@property (readonly) NSNumber* id;
@property (readonly) NSString* type;
@property (readonly) NSNumber* timeStamp;

-(NSXMLElement*)createNoteEventNode;
-(NSString*)noteEventType;

@end
