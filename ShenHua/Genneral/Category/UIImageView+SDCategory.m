//
//  UIImageView+BCCategory.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "UIImageView+SDCategory.h"


@implementation UIImageView (SDCategory)


//增加图片淡入淡出的功能
- (void)sd_setImageFadeWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
{
    [self sd_setImageFadeWithURL:url placeholderImage:placeholder  animateWithDuration:0.5f];
}

- (void)sd_setImageFadeWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder animateWithDuration:(CGFloat)duration;
{
    [self sd_setImageFadeWithURL:url placeholderImage:placeholder options: 0 animateWithDuration:duration];
}

- (void)sd_setImageFadeWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;
{
    [self sd_setImageFadeWithURL:url placeholderImage:placeholder options:options animateWithDuration:0.5];
}

- (void)sd_setImageFadeWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options animateWithDuration:(CGFloat)duration
{
    __weak typeof(self)wself = self;
    
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
        if(image && cacheType ==SDImageCacheTypeNone)
        {
            wself.alpha=0.0f;
            
            [UIView animateWithDuration:duration animations:^{
                
                wself.alpha=1.0f;
            }];
            
        }else
        {
            wself.alpha=1.0f;
        }
        
    }];
}


@end
