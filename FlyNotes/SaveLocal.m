//
//  SaveLocal.m
//  FlyNotes
//
//  Created by Nathan Thelen on 8/13/14.
//  Copyright (c) 2014 Nathan Thelen. All rights reserved.
//

#import "SaveLocal.h"

@implementation SaveLocal

NSFileManager *filemgr;

-(id)init: (NSString*) aFile
{
    mfile = aFile;
    filemgr = [NSFileManager defaultManager];
    
    if ([filemgr isWritableFileAtPath: aFile]  == YES)
        NSLog (@"File is writable");
    else
        NSLog (@"File is read only");
}

-(NSNumber*)write: (NSData*) aText
{
    NSFileHandle *file;
    NSMutableData *data;

    file = [NSFileHandle fileHandleForUpdatingAtPath:
            mfile];
    
    if (file == nil)
        NSLog(@"Failed to open file");

    [file writeData: data];
    [file closeFile];
}

-(NSData*)readAll
{
    return [filemgr contentsAtPath: mfile ];
}

-(BOOL)delete
{

    if ([filemgr removeItemAtPath:
         mfile error: NULL]  == YES);
}

-(NSInteger) saveImage:(UIImage*)image filename:(NSString*)file
{
    
    NSData *imageData = UIImagePNGRepresentation(image);
      
    if (![imageData writeToFile:file atomically:NO])
    {
        return -1;
    }
    else
    {
        return 0;
    }
}


@end
