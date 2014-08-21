//
//  UIImage+RCImage.h
//  RCKit
//
//  Created by Looping on 14-4-2.
//
// Ref https://github.com/Cocoanetics/DTFoundation
// License https://github.com/Cocoanetics/DTFoundation/blob/develop/LICENSE
//

#import <UIKit/UIKit.h>

@interface UIImage (RCImage)

+ (UIImage *)imageWithSolidColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)imageMaskedAndTintedWithColor:(UIColor *)color;
- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode;
- (UIImage *)tileImageInClipRect:(CGRect)clipRect inBounds:(CGRect)bounds scale:(CGFloat)scale;
- (UIImage *)compress;

@end
