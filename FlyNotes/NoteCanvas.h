//
//  NoteCanvas.h
//  FlyNotes
//
//  Created by Nathan Thelen on 6/5/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NoteCanvas <NSObject>

- (void) executeEvent:(NSString *)localName value:(NSString *)value;
- (void) executePage:(NSString *)localName value:(NSString *)value;

- (void) pause(NSString *)localName value:(NSString *)value;
- (void) stop(NSString *)localName value:(NSString *)value;

- (void) setMode:(NSString *)mode;
@end
