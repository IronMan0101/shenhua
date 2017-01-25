//
//  Util.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/19.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "Tool.h"
#import "Store.h"

@implementation Tool


/**
 *  打开URL 网页
 */
+(void)openURL:(NSString *)strURL
{
    NSString *preURL=@"http://";
    if (![strURL sd_startsWith:preURL])
    {
        strURL=[NSString stringWithFormat:@"%@%@",preURL,strURL ];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strURL]];
}

/**
 *  拨打电话
 */
+(void)openCALL:(UIView *)view  phoneNumber:(NSString *)phoneNumber
{

    UIWebView *webviewPhone = (UIWebView *)[view viewWithTag:PHONENUMBER_TAG];
    if (webviewPhone == nil)
    {
        webviewPhone = [[UIWebView alloc] initWithFrame:CGRectZero];
        webviewPhone.tag = PHONENUMBER_TAG;
        [view addSubview:webviewPhone];
    }
    NSString *realPhoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSURL *urlPhone = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",realPhoneNumber]];
    
    [webviewPhone loadRequest:[NSURLRequest requestWithURL:urlPhone]];
}



//是否首次安装打开
+ (BOOL)isFirstLanuch
{
    NSString *strKey=@"appversion";
    NSString *storeVersion =  [Store objectForKey:strKey];
    NSString *currentVersion = APP_VERSION;
  
    if ( storeVersion == nil ||  [storeVersion isEqualToString:@""] )
    {
        [Store setObject:storeVersion forkey:strKey];
        return YES;
    }
    if ([storeVersion isEqualToString:currentVersion])
    {
        return NO;
        
    }else
    {
        [Store setObject:storeVersion forkey:strKey];
        return YES;
    }
    
    return NO;
}

@end
