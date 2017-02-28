//
//  YTExtension.h
//  PrivateTalk
//
//  Created by Heaven on 2016/11/29.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#ifndef YTExtension_h
#define YTExtension_h

#import "UIView+YTExtension.h"
#import "UIColor+YTExtension.h"
#import "UIButton+YTExtension.h"
#import "UIBarButtonItem+YTExtension.h"
#import "NSString+YTExtension.h"
#import "NSDictionary+YTExtension.h"
#import "NSArray+YTExtension.h"
#import "CryptorTools.h"
#import "NSArray+Log.h"
#import "UIImage+ScreenShot.h"
#import "Tools.h"


#ifdef DEBUG

#define DLog(fmt, ...) NSLog((@"" fmt), ##__VA_ARGS__);
#define DMLog(fmt, ...) NSLog((@"%s : " fmt), __PRETTY_FUNCTION__ , ##__VA_ARGS__);
#define DSLog(...) NSLog(@"%s : %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__]);

#define kIsDebug YES

#else

#define DLog(...)
#define DMLog(...)
#define DSLog(...) do { } while (0)

#define kIsDebug NO

#endif


#endif /* YTExtension_h */
