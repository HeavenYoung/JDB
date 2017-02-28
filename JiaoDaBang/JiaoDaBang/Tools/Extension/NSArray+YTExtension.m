//
//  NSArray+YTExtension.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/6.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "NSArray+YTExtension.h"

@implementation NSArray (YTExtension)

- (id)objectAtIndexSafe:(NSUInteger)uindex
{
    NSInteger index = uindex;
    if (index < 0 || index >= self.count)
    {
        NSLog(@"NSArray objectAtIndexSafe out of bounds for array , %ld out of (0,%lu),array=%@",(long)index,(unsigned long)self.count,self);
        return nil;
    }
    return [self objectAtIndex:index];
}

@end

@implementation NSMutableArray (YTExtension)

- (void)addObjectSafe:(id)object
{
    if(nil != object)
    {
        return [self addObject:object];
    }
    return;
}

- (void)addObjectsFromArraySafe:(NSArray *)otherArray
{
    if([otherArray isKindOfClass:[NSArray class]])
    {
        return [self addObjectsFromArray:otherArray];
    }
    return;
}

@end
