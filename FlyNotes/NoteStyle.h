//
//  NoteStyle.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/3/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Style.h"

@interface NoteStyle : NSObject <Style>

@property NSNumber* bold;
@property NSNumber* italic;
@property NSNumber* underline;
@property NSString* font;

@end
