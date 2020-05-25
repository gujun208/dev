//
//  UIImage+ResizeMagick.h
//
//
//  Created by Vlad Andersen on 1/5/13.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (ResizeMagick)

- (NSString *) resizedAndReturnPath;
- (NSData *) resizedAndReturnData;

- (UIImage *) resizedImageByMagick: (NSString *) spec;
- (UIImage *) resizedImageByWidth:  (NSUInteger) width;
- (UIImage *) resizedImageByHeight: (NSUInteger) height;
- (UIImage *) resizedImageWithMaximumSize: (CGSize) size;
- (UIImage *) resizedImageWithMinimumSize: (CGSize) size;

/*
 *  压缩图片方法(压缩尺寸)
 */
-(NSData *)compressWithLengthLimit:(NSUInteger)maxLength;


+(UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize;

+(UIImage *) imageWithImageSimple:(UIImage*)image scaled:(float) scaled;
+ (UIImage *)stringToImage:(NSString *)str;
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
