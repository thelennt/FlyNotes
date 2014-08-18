//
//  PDF2Image.m
//  FlyNotes
//
//  Created by Nathan Thelen on 8/17/14.
//  Copyright (c) 2014 Nathan Thelen. All rights reserved.
//

#import "PDF2Image.h"

@implementation PDF2Image

-(id)init:(NSString*)lfilename
{
    filename = lfilename;
}

-(NSArray*) convertToPDF:(NSString*)pdfFile
{
    CGFloat dpi = 100.0 / 72.0;
    
    CGPDFPageRef pdfPageRef = [self pdfReferenceForPage:pageNumber];
    
    CGSize pageSize = [self sizeOfPage:pageNumber];
    pageSize.width = pageSize.width * dpi;
    pageSize.height = pageSize.height * dpi;
    
    UIGraphicsBeginImageContext(pageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextTranslateCTM(context, 0.0, pageSize.height);
    CGContextScaleCTM(context, dpi, -dpi);
    CGContextSaveGState(context);
    //CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(pdfPageRef, kCGPDFCropBox, CGRectMake(0, 0, pageSize.width, pageSize.height), 0, true);
    //CGContextConcatCTM(context, pdfTransform);
    CGContextDrawPDFPage(context, pdfPageRef);
    CGContextRestoreGState(context);
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

@end
