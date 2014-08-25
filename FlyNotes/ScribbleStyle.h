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
    NSUInteger identifier;
    NSString* color;
    NSUInteger depth;
}

- (id)init:(NSUInteger)aid color:(NSString*)acolor depth:(NSUInteger)adepth;
- (id)init:(NSDictionary*)dictionary;

@property (readonly) NSString* color;
@property (readonly) NSUInteger depth;

@end
