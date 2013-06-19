//
//  Stack.h
//  FlyNotes
//
//  Created by Dominik Krejčík on 25/09/2011.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject
{
    NSMutableArray* array;
}

// Removes and returns the element at the top of the stack
-(id)pop;
// Adds the element to the top of the stack
-(void)push:(id)element;
// Removes all elements
-(void)pushElementsFromArray:(NSArray*)arr;
-(void)clear;

// Returns the object at the top of the stack
-(id)peek;
// Returns the size of the stack
-(NSInteger)size;
// Returns YES if the stack is empty
-(BOOL)isEmpty;@end
