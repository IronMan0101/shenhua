//
//  NSString+BCCategory.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SDCategory)



- (unichar)    sd_charAt:(NSInteger)index;                                    //获取指定单个字符
- (BOOL)       sd_startsWith:(NSString*)prefix;                               //是某个字符串为开始
- (BOOL)       sd_endsWith:(NSString*)suffix;                                 //是某个字符串为结束
- (BOOL)       sd_equals:(NSString*) anotherString;                           //字符串是否相等
- (BOOL)       sd_equalsIgnoreCase:(NSString*) anotherString;                 //字符串是否相等忽略大小写
- (BOOL)       sd_contains:(NSString*) str;                                   //是否包含某一个字符串
- (NSString *) sd_toLowerCase;                                                //转化小写字母
- (NSString *) sd_toUpperCase;                                                //转化大写字母
- (NSString *) sd_trim;                                                       //去掉两端空格
- (NSString *) sd_replaceAll:(NSString*)origin with:(NSString*)replacement;   //替换字符串
- (NSArray *)  sd_split:(NSString*) separator;                                //拆分为数组
- (NSString *) sd_substringFromIndex:(NSInteger)begin toIndex:(NSInteger)end; //截取字符串
+ (BOOL)       sd_isEmpty:(NSString *)string;                                 //判断字符串是否为空
+ (NSString *) sd_removeNil:(NSString*)content;                               //把nil转成“”
- (NSString *) sd_leftPad:(NSInteger)sum withString:(NSString *)withString;   //左边补什么
- (NSString *) sd_leftPadWithEmtpy:(NSInteger)sum;                            //左边用空格补齐
- (NSString *) sd_leftPadWithZero:(NSInteger)sum;                             //左边用0补齐

- (NSString *) sd_md5;                                                        //生成md5
- (NSString *) sd_encodeURLString;                                            //url编码
- (NSString *) sd_decodeURLString;                                            //url解码


+ (UIColor *)  sd_hexToColor:(NSString *)strHex;                             //把16进制RGB字符串转成UIColor务必对UIColor值为真进行判断进行判断
+ (CGFloat)    sd_getWith:(NSString *)text   font:(UIFont *)font;            //获取文本的宽度


+ (NSDictionary *)sd_JsonStringToDictionary:(NSString *)jsonString;         //JSON字符串转字典
+ (NSString*)  sd_dictionaryToJsonString:(NSDictionary *)dic;               //字典转JSON字符串

@end