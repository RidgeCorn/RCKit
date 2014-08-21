//
//  RCLogger.h
//  RCKit
//
//  Created by Looping on 14-4-23.
//
//  The MIT License (MIT)
//  Copyright (c) 2014 Ridgecorn (http://ridgecorn.com/ )
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
