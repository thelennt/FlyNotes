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

- (id)init:(NSNumber*)aid bold:(NSUInteger)abold italic:(NSUInteger)aitalic underline:(NSUInteger)aunderline font:(NSNumber*)afont;
- (id)init:(NSDictionary*)dictionary;

@property (readonly) NSUInteger bold;
@property (readonly) NSUInteger italic;
@property (readonly) NSUInteger underline;
@property (readonly) NSString* font;

@end
