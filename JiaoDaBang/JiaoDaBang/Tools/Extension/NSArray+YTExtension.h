//
//  NSArray+YTExtension.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/6.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YTExtension)

/*!
 *	@brief	作用和objectAtIndex相同，不同的是此方法添加了容错处理。
 *
 *	@param 	uindex 	角标
 *
 *  @return	数组中uindex角标位置的数据
 */
- (id)objectAtIndexSafe:(NSUInteger)uindex;

@end

@interface NSMutableArray (YTExtension)

/*!
 *	@brief	作用和addObjectSafe相同，不同的是此方法添加了容错处理。
 */
- (void)addObjectSafe:(id)object;

/*!
 *	@brief	作用和addObjectsFromArraySafe相同，不同的是此方法添加了容错处理。
 *
 */
- (void)addObjectsFromArraySafe:(NSArray *)otherArray;

@end
