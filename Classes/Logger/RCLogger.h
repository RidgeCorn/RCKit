//
//  RCLogger.h
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef RC_LOGGER_ENABLE

#ifdef DEBUG
#define RC_LOGGER_ENABLE 1

#else
#define RC_LOGGER_ENABLE 0

#endif
#endif

#if RC_LOGGER_ENABLE != 0

#ifdef LOG_VERBOSE
extern int ddLogLevel;
#define RCLog(...)  DDLogVerbose(__VA_ARGS__)

#else

#define RCLog(...) \
NSLog(@"\n \
\n \
== == == == == == == == == == == == == == == ==RCLog Begin== == == == == == == == == == == == == == == ==/*\n \
\n \
File:\t\t%s\n \
Method:\t%s\n \
Line:\t\t%d\n \
Mem:\t\t%p\n \
\n \
Info:\n \
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --Info Begin-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --//\n \
%@\n \
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --Info End-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --//\n \
\n \
== == == == == == == == == == == == == == == ==RCLog End== == == == == == == == == == == == == == == ==*/\n \
\n", \
__FILE__, \
__PRETTY_FUNCTION__, \
__LINE__, \
self, \
\
[NSString stringWithFormat:__VA_ARGS__])


#endif
#else
#define RCLog(...) ((void)0)

#endif

@interface RCLogger : NSObject

@end
