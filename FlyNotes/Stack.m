//
//  Stack.m
//  FlyNotes
//
//  Created by Dominik Krejčík on 25/09/2011.
//

#import "Stack.h"

@implementation Stack

-(id)init
{
	if ( (self = [super init]) ) {
		array = [[NSMutableArray alloc] init];
	}
    
	return self;
}

-(id)pop
{
	id object = [self peek];
	[array removeLastObject];
	return object;
}

-(void)push:(id)element
{
    [array addObject:element];
}

-(void)pushElementsFromArray:(NSArray*)arr
{
    [array addObjectsFromArray:arr];
}

-(id)peek
{
    return [array lastObject];
}

-(NSInteger)size
{
    return [array count];
}

-(BOOL)isEmpty
{
    return [array count] == 0;
}

-(void)clear
{
    [array removeAllObjects];
}

@end
@end
