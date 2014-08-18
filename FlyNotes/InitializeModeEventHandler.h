//
//  InitializeModeEventHandler.h
//  FlyNotes
//
//  Created by Nathan Thelen on 8/17/14.
//  Copyright (c) 2014 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesStore.h"

@interface InitializeModeEventHandler : NSObject
{
    
}

-(NSArray*) ConvertFromPDFToImage:(NSString*)file;
-(UIImage*) SetDefaultImage:(NSString*)file;
-(NSUInteger) GetPDFPages:(NSString*)file;
-(NotesStore*) RecordModeReady:(NSArray*) pages savetype:(id)save;
@end
