//
//  NSDictionary+YTExtension.h
//  PrivateTalk
//
//  Created by Heaven on 2016/11/29.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YTExtension)

/*!
 *	@brief	作用和objectForKey相同，不同的是此方法添加了容错处理。当objectForKey取出的数据是null时会处理成nil并返回结果
 *	@param 	key 	key值
 *  @return	value是id类型的数据
 */
- (id)objectForKeySafe:(id)key;

/*!
 *	@brief	作用和objectForKey相同，不同的是此方法添加了容错处理。当objectForKey取出的数据是null时会处理成nil并返回结果
 *	@param 	key 	key值
 *  @return	value是NSString类型的数据
 */
- (NSString *)stringForKeySafe:(id)key;

/*!
 *	@brief	作用和objectForKey相同，不同的是此方法添加了容错处理。当objectForKey取出的数据是null时会处理成0并返回结果
 *	@param 	key 	key值
 *  @return	value是NSInteger类型的数据
 */
- (NSInteger)integerForKeySafe:(id)key;

/*!
 *	@brief	作用和objectForKey相同，不同的是此方法添加了容错处理。当objectForKey取出的数据是null时会处理成0并返回结果
 *	@param 	key 	key值
 *  @return	value是NSTimeInterval类型的数据
 */
- (NSTimeInterval)timeIntervalForKeySafe:(id)key;

/*!
 *	@brief	作用和objectForKey相同，不同的是此方法添加了容错处理。当objectForKey取出的数据是null时会处理成NO并返回结果
 *	@param 	key 	key值
 *  @return	value是BOOL类型的数据
 */
- (BOOL)boolForKeySafe:(id)key;

/*!
 *	@brief	作用和objectForKey相同，不同的是此方法添加了容错处理。当objectForKey取出的数据是null时会处理成nil并返回结果
 *	@param 	key 	key值
 *  @return	value是NSArray类型的数据
 */
- (NSArray *)arrayForKeySafe:(id)key;

/*!
 *	@brief	作用和objectForKey相同，不同的是此方法添加了容错处理。当objectForKey取出的数据是null时会处理成nil并返回结果
 *	@param 	key 	key值
 *  @return	value是NSArray类型的数据
 */
- (NSDictionary *)dictionaryForKeySafe:(id)key;

@end

@interface NSMutableDictionary (YTExtension)

- (void)setObjectSafe:(id)object forKey:(id<NSCopying>)key;

@end
