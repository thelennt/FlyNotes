//
//  SaveLocal.h
//  FlyNotes
//
//  Created by Nathan Thelen on 8/13/14.
//  Copyright (c) 2014 Nathan Thelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveMe.h"


@interface SaveLocal : NSObject <SaveMe>
{
    NSString* mfile;
    
}

-(id)init: (NSString*) aFile;
-(NSNumber*)write: (NSData*) aText;
-(NSData*)readAll;
-(NSInteger) saveImage:(UIImage*)image filename:(NSString*)file;
-(BOOL)delete;

@end
