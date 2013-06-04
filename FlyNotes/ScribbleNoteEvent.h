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

@property NSString* charText;
@property NSPointArray* locations;
@property NSNumber* timeStamp;
@property ScribbleStyle* style;

@end
