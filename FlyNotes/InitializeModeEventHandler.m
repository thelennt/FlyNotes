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
        UIImage *img = [ UIImage imageWithPDFNamed:file atHeight:90 ];
        [temp addObject:img];
    }

    return temp;
}

-(UIImage*) SetDefaultImage:(NSString*)file
{
    defaultImage = file;
    return [ UIImage imageWithPDFNamed:file atHeight:90 ];
}

-(NSUInteger) GetPDFPages:(NSString*)file
{

    NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:file withExtension:nil];
    CGPDFDocumentRef pdf = CGPDFDocumentCreateWithURL((__bridge CFURLRef)pdfURL);
    NSUInteger pageCount = CGPDFDocumentGetNumberOfPages(pdf);
    return pageCount;
}

-(NotesStore*) RecordModeReady:(NSArray*) pages savetype:(id)save;
{
    NotesStore* temp = [[NotesStore alloc]init];
    
    for(UIImage *temp2 in pages)
    {
        NSMutableString* tempString = [NSString stringWithFormat:@"%d",[temp getPages]];
     
        [tempString appendString:@"png"];
        [save saveImage:temp2 filename:tempString];
        [temp newNotesPage:[[NotesScribblePage alloc]init:[NSNumber numberWithInt:[temp getPages] ] Background:tempString]];
    }
    return temp;
}



@end
