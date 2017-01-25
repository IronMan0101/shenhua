//
//  UIView+BCCategory.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SDCategory)



/**
 *  获取x
 */
- (CGFloat)sd_x;
/**
 *  获取y
 */
- (CGFloat)sd_y;
/**
 *  获取width
 */
- (CGFloat)sd_width;
/**
 *  获取height
 */
- (CGFloat)sd_height;
/**
 *  获取size
 */
- (CGSize)sd_size;


/**
 *  设置x坐标
 */
- (void)sd_setX:(CGFloat)originX;
/**
 *  设置y坐标
 */
- (void)sd_setY:(CGFloat)originY;
/**
 *  设置with宽度
 */
- (void)sd_setWidth:(CGFloat)width;
/**
 *  设置height宽度
 */
- (void)sd_setHeight:(CGFloat)height;

/**
 *  增加with宽度
 */
- (void)sd_addWidth:(CGFloat)width;
/**
 *  增加height宽度
 */
- (void)sd_addHeight:(CGFloat)height;

/**
 *  减少with宽度
 */
- (void)sd_subWidth:(CGFloat)width;
/**
 *  减少height宽度
 */
- (void)sd_subHeight:(CGFloat)height;


/**
 *  设置size大小
 */
- (void)sd_setSize:(CGSize)size;


// 移除此view上的所有子视图
- (void)sd_removeAllSubviews;
//移除指定的tag的view
- (void)sd_removeViewWithTag:(NSInteger)tag;
////打印frame的大小
-(void)sd_logFrame:(NSString *)tip;
//加载xib
+ (id)sd_loadNib:(NSString*)nibName;
//添加圆角、边框
-(void)sd_addCornerRadiusBorder:(CGFloat)cornerRadius  borderWidth:(CGFloat)borderWidth   borderColor:(UIColor*)borderColor;
//加圆角
-(void)sd_addCornerRadius:(CGFloat)cornerRadius;
//加边框
-(void)sd_addCornerBorder:(CGFloat)borderWidth   borderColor:(UIColor*)borderColor;

@end
