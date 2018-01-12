//
//  UIButton+BackgroundColor.m
//  ActivitySharing
//
//  Created by sherlock on 2018/1/9.
//  Copyright © 2018年 cgy. All rights reserved.
//

#import "UIButton+BackgroundColor.h"

@implementation UIButton (BackgroundColor)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(10, 10), NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [backgroundColor setFill];
    CGContextFillRect(ctx, CGRectMake(0, 0, 10, 10));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setImage:image forState:state];
}

@end
