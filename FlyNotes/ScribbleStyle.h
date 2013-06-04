//
//  ScribbleStyle.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/3/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Style.h"

@interface ScribbleStyle : NSObject  <Style>

@property NSString* color;
@property NSString* depth;

@end