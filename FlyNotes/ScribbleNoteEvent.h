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

@interface ScribbleNoteEvent : NSObject
-(id)init: (NSNumber*)id TimeStamp:(NSNumber*)atimeStamp Style:(ScribbleStyle*)astyle;
-(void)addPoint:(CGPoint)apoint;

@property (readonly) NSMutableArray* locations;
@property (readonly) ScribbleStyle* style;

@end
