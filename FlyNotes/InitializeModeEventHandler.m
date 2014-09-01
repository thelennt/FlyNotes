//
//  InitializeModeEventHandler.m
//  FlyNotes
//
//  Created by Nathan Thelen on 8/17/14.
//  Copyright (c) 2014 Nathan Thelen. All rights reserved.
//

#import "InitializeModeEventHandler.h"
#import "UIImage+PDF.h"
#import "NotesStore.h"
#import "NotesScribblePage.h"
#import "SaveMe.h"

@implementation InitializeModeEventHandler
@synthesize defaultImage;

-(id)init
{
    defaultImage = @"Default.png";
    return self;
}

-(NSArray*) ConvertFromPDFToImage:(NSString*)file
{
    NSMutableArray *temp = [[NSMutableArray alloc ]init];
    
    NSUInteger pageCount = [self GetPDFPages:file];
    for(NSUInteger i=0;i<pageCount;i++)
    {
        UIImage *img = [ UIImage imageWithPDFURL:[NSURL URLWithString:file] atHeight:500 atPage:i+1];
        [temp addObject:img];
    }

    return temp;
}

-(UIImage*) SetDefaultImage:(NSString*)file
{
    defaultImage = file;
    return [ UIImage imageWithPDFNamed:file atHeight:1000 ];
}

-(NSUInteger) GetPDFPages:(NSString*)file
{
    CFStringRef fullPathEscaped = CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)file, NULL, NULL,kCFStringEncodingUTF8);
    CFURLRef url = CFURLCreateWithString(NULL, (CFStringRef)(fullPathEscaped), NULL);
    CGPDFDocumentRef SourcePDFDocument = CGPDFDocumentCreateWithURL(url);
    NSUInteger pageCount = CGPDFDocumentGetNumberOfPages(SourcePDFDocument);
    return pageCount;
}

-(NotesStore*) RecordModeReady:(NSArray*) pages savetype:(id)save;
{
    NotesStore* temp = [[NotesStore alloc]init];
    
    for(UIImage *temp2 in pages)
    {
        NSString *documentsDirectory = [NSHomeDirectory()
                                        stringByAppendingPathComponent:@"Documents"];

        NSString* tempString1 =[NSString stringWithFormat:@"/Image%d.png",[temp getPages]];                   
        NSString* tempString2 = [documentsDirectory stringByAppendingPathComponent:tempString1];
        
        [save saveImage:temp2 filename:tempString2];
        
        [temp newNotesPage:[[NotesScribblePage alloc]init:[temp getPages] Background:[NSURL fileURLWithPath:tempString2]]];
    }
    return temp;
}



@end
