//
//  NSString+BCCategory.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "NSString+SDCategory.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SDCategory)


//获取指定单个字符
- (unichar) sd_charAt:(NSInteger)index
{
    return [self characterAtIndex:index];
}
//是某个字符串为开始
- (BOOL) sd_startsWith:(NSString*)prefix
{
    return [self hasPrefix:prefix];
}
//是某个字符串为结束
- (BOOL) sd_endsWith:(NSString*)suffix
{
    return [self hasSuffix:suffix];
}
//字符串是否相等
- (BOOL) sd_equals:(NSString*) anotherString
{
    return [self isEqualToString:anotherString];
}
//字符串是否相等忽略大小写
- (BOOL) sd_equalsIgnoreCase:(NSString*) anotherString
{
    return [[self sd_toLowerCase] sd_equals:[anotherString sd_toLowerCase]];
}
//是否包含某一个字符串
- (BOOL)sd_contains:(NSString*) str
{
    NSRange range = [self rangeOfString:str];
    return (range.location != NSNotFound);
}
//转化小写字母
- (NSString *)sd_toLowerCase
{
    return [self lowercaseString];
}
//转化大写字母
- (NSString *)sd_toUpperCase
{
    return [self uppercaseString];
}
//去掉两端空格
- (NSString *)sd_trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
// 替换字符串
- (NSString *)sd_replaceAll:(NSString*)origin with:(NSString*)replacement
{
    return [self stringByReplacingOccurrencesOfString:origin withString:replacement];
}
//拆分为数组
- (NSArray *)sd_split:(NSString*)separator
{
    return [self componentsSeparatedByString:separator];
}
//截取字符串
- (NSString *) sd_substringFromIndex:(NSInteger)beginIndex toIndex:(NSInteger)endIndex
{
    if (endIndex <= beginIndex)
    {
        return @"";
    }
    NSRange range = NSMakeRange(beginIndex, endIndex - beginIndex);
    return [self substringWithRange:range];
}

//判断字符串是否为空
+ (BOOL)sd_isEmpty:(NSString *)string
{
    
    if (string == nil || string == NULL)
    {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        return YES;
    }
    
    return NO;
}

//把nil转成“”
+(NSString *)sd_removeNil:(NSString*)content
{
    if([NSString sd_isEmpty:content])
    {
        return @"";
    }
    return content;
}
//右边补几位
-(NSString *)sd_leftPad:(NSInteger)sum  withString:(NSString *)withString
{
    NSInteger leave= sum-  self.length;
    NSString *str=@"";
    
    if (leave<=0)
    {
        return self;
    }
    
    for (NSInteger i=0; i<leave; i++)
    {
        str=[str stringByAppendingString:withString];
    }
    
    str=[str stringByAppendingString:self];
    
    return str;
}
//左边用空格补齐
-(NSString *)sd_leftPadWithEmtpy:(NSInteger)sum
{
    return [self sd_leftPad:sum withString:@" "];
}

//左边用0补齐
-(NSString *)sd_leftPadWithZero:(NSInteger)sum
{
    return [self sd_leftPad:sum withString:@"0"];
}

//生成md5
- (NSString *)sd_md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)(strlen(cStr)), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 *  url 编码
 *  IOS中对Url进行编码和解码
 *  http://blog.csdn.net/tianyitianyi1/article/details/17579997
 */
- (NSString *)sd_encodeURLString
{
    NSString* outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                             
                                                                             NULL, /* allocator */
                                                                             
                                                                             (__bridge CFStringRef)self,
                                                                             
                                                                             NULL, /* charactersToLeaveUnescaped */
                                                                             
                                                                             (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                             
                                                                             kCFStringEncodingUTF8);
    
    
    return outputStr;
}
/**
 *  url解码
 */
- (NSString *)sd_decodeURLString
{
    NSMutableString *outputStr = [NSMutableString stringWithString:self];
    
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0,[outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}



// 把16进制RGB字符串转成UIColor务必对UIColor值为真进行判断进行判断
+(UIColor *)sd_hexToColor:(NSString *)strHex
{
    strHex = [strHex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    NSInteger len=[strHex length];
    
    if (len!=6)
    {
        return  nil;
    }
    
   //NSLog(@"strHex::%@",strHex);
    
    GLfloat  red = strtoul([[strHex substringWithRange:NSMakeRange(0, 2)] UTF8String],0,16);
    GLfloat  green = strtoul([[strHex substringWithRange:NSMakeRange(2, 2)] UTF8String],0,16);
    GLfloat  blue = strtoul([[strHex substringWithRange:NSMakeRange(4, 2)] UTF8String],0,16);
    
    //NSLog(@"%f,%f,%f",red,green,blue);
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

//获取文本的宽度
+(CGFloat)sd_getWith:(NSString *)text   font:(UIFont *)font
{
    
    NSDictionary *attriPreTip = @{NSFontAttributeName:font};
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT,0)
                                     options:    NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attriPreTip
                                     context:nil].size;
    
    return size.width;
}


@end
