//
//  UIView+BCCategory.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "UIView+SDCategory.h"

@implementation UIView (SDCategory)


/**
 *  获取x
 */
- (CGFloat)sd_x
{
    return self.frame.origin.x;
}

/**
 *  获取y
 */
- (CGFloat)sd_y
{
    return self.frame.origin.y;
}
/**
 *  获取width
 */
- (CGFloat)sd_width
{
    return self.frame.size.width;
}

/**
 *  获取height
 */
- (CGFloat)sd_height
{
    return self.frame.size.height;
}
/**
 *  获取size
 */
- (CGSize)sd_size
{
    return self.frame.size;
}



/**
 *  设置x坐标
 */
- (void)sd_setX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

/**
 *  设置y坐标
 */
- (void)sd_setY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

/**
 *  设置with宽度
 */
- (void)sd_setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
/**
 *  设置height宽度
 */
- (void)sd_setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


/**
 *  增加with宽度
 */
- (void)sd_addWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width += width;
    self.frame = frame;
}

/**
 *  增加height宽度
 */
- (void)sd_addHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height +=height;
    self.frame = frame;
}

/**
 *  减少with宽度
 */
- (void)sd_subWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width -= width;
    self.frame = frame;
}
/**
 *  减少height宽度
 */
- (void)sd_subHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height -=height;
    self.frame = frame;
}



/**
 *  设置size大小
 */
- (void)sd_setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}



// 移除此view上的所有子视图
- (void)sd_removeAllSubviews
{
    for (UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
}

//移除指定的tag的view
- (void)sd_removeViewWithTag:(NSInteger)tag
{
    for (UIView *view in [self subviews])
    {
        if (view.tag == tag)
        {
            [view removeFromSuperview];
        }
    }
}

//打印frame的大小
-(void)sd_logFrame:(NSString *)tip
{
    NSLog(@"%@ -- %@",tip,NSStringFromCGRect(self.frame));
}


// 加载Xib
+ (id)sd_loadNib
{
//    NSArray *view=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
//    NSLog(@"view:%@",view);
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

// 加载Xib
+ (id)sd_loadNibName:(NSString*)nibName
{
    return [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] lastObject];
}

//添加圆角、边框
-(void)sd_addCornerRadiusBorder:(CGFloat)cornerRadius  borderWidth:(CGFloat)borderWidth   borderColor:(UIColor*)borderColor
{
    [self sd_addCornerRadius:cornerRadius];
    [self sd_addCornerBorder:borderWidth borderColor:borderColor];
}

//加圆角
-(void)sd_addCornerRadius:(CGFloat)cornerRadius
{
    [self.layer setCornerRadius:cornerRadius];
    [self.layer setMasksToBounds:YES];
}

//加边框
-(void)sd_addCornerBorder:(CGFloat)borderWidth   borderColor:(UIColor*)borderColor
{
    [self.layer setBorderWidth:borderWidth];
    
    if(borderColor)
    {
        [self.layer setBorderColor:[borderColor CGColor]];
    }
}





@end
