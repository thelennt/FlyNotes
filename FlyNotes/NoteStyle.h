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

- (id)init:(NSNumber*)aid bold:(NSNumber*)abold italic:(NSNumber*)aitalic underline:(NSNumber*)aunderline font:(NSNumber*)afont;

@property (readonly) NSNumber* bold;
@property (readonly) NSNumber* italic;
@property (readonly) NSNumber* underline;
@property (readonly) NSString* font;

@end
