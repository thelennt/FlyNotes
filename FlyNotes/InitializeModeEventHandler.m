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
-(id)init
{
    
    
}

-(NSArray*) ConvertFromPDFToImage:(NSString*)file
{
    NSArray *temp = [[NSArray alloc ]init];
    
    NSUInteger pageCount = [GetPDFPages:file];
    for(NSUInteger i=0;i<pageCount;i++)
    {
        UIImage *img = [ UIImage imageWithPDFNamed:file atHeight:90 ];
        [temp addObject:img];
    }
    return temp;
}

-(UIImage*) SetDefaultImage:(NSString*)file
{
    defaultImage = file;
}

-(NSUInteger) GetPDFPages:(NSString*)file
{

    NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:file withExtension:nil];
    CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
    NSUInteger pageCount = CGPDFDocumentGetNumberOfPages(pdf);
    return pageCount;
}

-(NotesStore*) RecordModeReady:(NSArray*) pages savetype:(id)save;
{
    NotesStore* temp = [[NotesStore alloc]init];
    
    for(UIImage temp in pages)
    {
        (NSNumber*)anumber Background:(NSString*)abackground;
        
        [temp addPage:temp];
        NSString *fileName = [[[temp count] stringValue] append:@"png"]
        [save saveImage:temp fileName:fileName;
        [temp newNotesPage:[ScribbleNotePage alloc]init:[[temp count] aBackground:fileName]];
    }
}



@end
