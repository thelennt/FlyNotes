//
//  SaveMe.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/23/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SaveMe <NSObject>
-(id)init: (NSString*) aFile;
-(NSNumber*)write: (NSData*) aText;
-(NSData*)readAll;
-(NSInteger) saveImage:(UIImage*)image filename:(NSString*)file;
-(BOOL)delete;
@end
