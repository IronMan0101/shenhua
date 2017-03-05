//
//  UIButton+BCCategory.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "UIButton+SDCategory.h"
#import <objc/message.h>

@implementation UIButton (SDCategory)


-(void)setType:(NSString *)type
{
    //对象    属性key  属性value   policy 策略
    objc_setAssociatedObject(self, @"type", type, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)type
{
    
    //对象    属性key  属性value   policy 策略
    return objc_getAssociatedObject(self, @"type");
}



+(void)load
{
    Method  methodOld=  class_getClassMethod(self, @selector(setTitle:forState:));
    Method  methodNew=  class_getClassMethod(self, @selector(setMaxTitle));
    method_exchangeImplementations(methodNew, methodOld);
}

-(void)setMaxTitle
{
    NSLog(@"max title");
}

@end
