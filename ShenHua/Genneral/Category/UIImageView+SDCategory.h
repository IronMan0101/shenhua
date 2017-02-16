//
//  UIImageView+BCCategory.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"



@interface UIImageView (SDCategory)


//增加图片淡入淡出的功能
- (void)sd_setImageFadeWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)sd_setImageFadeWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder animateWithDuration:(CGFloat)duration;

- (void)sd_setImageFadeWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

- (void)sd_setImageFadeWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options animateWithDuration:(CGFloat)duration;


@end
