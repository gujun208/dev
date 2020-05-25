#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DYMakeModel.h"
#import "DYModelMaker.h"
#import "DYPropertyString.h"
#import "NSObject+DYModelArchive.h"

FOUNDATION_EXPORT double DYModelMakerVersionNumber;
FOUNDATION_EXPORT const unsigned char DYModelMakerVersionString[];

