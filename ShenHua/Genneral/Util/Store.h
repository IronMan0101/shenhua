//
//  Store.h
//  ShenHua
//
//  Created by suzq on 16/2/16.
//  Copyright © 2016年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject


//保存数据
+(void)setObject:(id)value  forkey:(NSString *)key;
//读取数据
+(id)objectForKey:(NSString *)key;


@end
