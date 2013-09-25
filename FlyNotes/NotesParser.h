//
//  NotesParser.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/22/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesStore.h"

@interface NotesParser : NSObject
{
    @private
    NotesStore *notes;
}
@property (readonly) NotesStore *notes;

- (id)init:(NSNumber*)aid color:(NSString*)acolor depth:(NSNumber*)adepth;
    
@end
