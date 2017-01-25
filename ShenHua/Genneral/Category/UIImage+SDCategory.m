//
//  UIImage+Category.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/10.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "UIImage+SDCategory.h"

@implementation UIImage (SDCategory)

/**
 *  缩放到给定大小
 */
-(UIImage*)sd_scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}


@end
