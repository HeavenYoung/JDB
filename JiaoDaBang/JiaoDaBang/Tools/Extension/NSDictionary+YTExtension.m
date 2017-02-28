//
//  NSDictionary+YTExtension.m
//  PrivateTalk
//
//  Created by Heaven on 2016/11/29.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "NSDictionary+YTExtension.h"

@implementation NSDictionary (YTExtension)

- (id)objectForKeySafe:(id)key {
    if (!key) {
        NSLog(@"NSDictionary objectForKeySafe use nil key,dictionary=%@", self);
        return nil;
    }
    return [self objectForKey:key];
}

- (NSString *)stringForKeySafe:(id)key {
    NSString * value = [self objectForKeySafe:key];
    if (value && ![value isKindOfClass:[NSNull class]])
    {
        if ([value isKindOfClass:[NSString class]])
        {
            return value;
        }
        else if ([value isKindOfClass:[NSNumber class]])
        {
            return [NSString stringWithFormat:@"%@",value];
        }
        return nil;
    }
    return nil;
}

- (NSInteger)integerForKeySafe:(id)key {
    NSString * value = [self objectForKeySafe:key];
    if(value && [value respondsToSelector:@selector(integerValue)])
    {
        return [value integerValue];
    }
    return 0;
}

-(NSTimeInterval)timeIntervalForKeySafe:(id)key {
    NSString * value = [self objectForKeySafe:key];
    if(value && [value respondsToSelector:@selector(doubleValue)])
    {
        return [value doubleValue];
    }
    return 0;
}

- (BOOL)boolForKeySafe:(id)key {
    NSString * value = [self objectForKeySafe:key];
    if(value && [value respondsToSelector:@selector(boolValue)])
    {
        return [value boolValue];
    }
    return NO;
}

- (NSArray *)arrayForKeySafe:(id)key {
    NSArray * value = [self objectForKeySafe:key];
    if(value && [value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

- (NSDictionary *)dictionaryForKeySafe:(id)key {
    NSDictionary * value = [self objectForKeySafe:key];
    if(value && [value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

@end


@implementation NSMutableDictionary (YTExtension)

- (void)setObjectSafe:(id)object forKey:(id<NSCopying>)key {
    if(!object || !key)
    {
        NSLog(@"NSDictionary setObjectSafe set nil value or key ,value=%@,key=%@,dictionary=%@",object ,key, self);
        return;
    }
    return [self setObject:object forKey:key];
}

@end
