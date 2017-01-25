//
//  Store.m
//  ShenHua
//
//  Created by suzq on 16/2/16.
//  Copyright © 2016年 suzhiqiu. All rights reserved.
//

#import "Store.h"

@implementation Store

//保存数据
+(void)setObject:(id)value  forkey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//读取数据
+(id)objectForKey:(NSString *)key
{
   return  [[NSUserDefaults standardUserDefaults] objectForKey:key];
}


@end
