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
{
@protected
    NSString* type;
    NSNumber* identifier;
    NSString* color;
    NSNumber* depth;
}

- (id)init:(NSNumber*)aid color:(NSString*)acolor depth:(NSNumber*)adepth;
- (id)init:(NSDictionary*)dictionary;

@property (readonly) NSString* color;
@property (readonly) NSNumber* depth;

@end
