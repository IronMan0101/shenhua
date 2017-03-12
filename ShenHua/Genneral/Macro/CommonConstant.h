//
//  Macros.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#ifndef ShenHua_Macros_h
#define ShenHua_Macros_h

#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width    //屏幕宽度
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height   //屏幕高度
#define SCREEN_SCALE            [UIScreen mainScreen].scale                //屏幕scale
#define SCREEN_RATIO            (SCREEN_WIDTH/320.0f)                      //系统屏幕宽度和320的比例
#define SCREEN_RATIO_375        (SCREEN_WIDTH/375.0f)                      //系统屏幕宽度和375的比例
#define SCREEN_By320(x)         ceil(x * SCREEN_RATIO)                     //按320的设计，进行尺寸转换 iphone 5
#define SCREEN_By375(x)         ceil(x * SCREEN_RATIO_375)                 //按375的设计，进行尺寸转换 iphone 6
#define STATUSBAR_HEIGHT        20                                         //状态栏高度
#define NAVBAR_HEIGHT           44                                         //UINavgationbar高度
#define NAVSTAUSBAR_HEIGHT      64                                         //UINavgationbar高度
#define TABBAR_HEIGHT           49                                         //UITabbBar高度
#define LABEL_HEIGHT            21                                         //默认UILabel高度
#define CELL_HEIGHT             44                                         //默认cell高度
#define NAVITEM_WIDTH           60                                         //默认nav item的宽度
#define NAVITEM_HEIGHT          44                                         //默认nav item的高度


#define IOS7_OR_LATER           [[[UIDevice currentDevice] systemVersion] integerValue] >=7
#define IOS8_OR_LATER           [[[UIDevice currentDevice] systemVersion] integerValue] >=8
#define IOS9_OR_LATER           [[[UIDevice currentDevice] systemVersion] integerValue] >=9
#define IOS10_OR_LATER          [[[UIDevice currentDevice] systemVersion] integerValue] >=10

#define IS_IPAD                 (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
#define IS_IPHONE               (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
#define IS_RETINA               (SCREEN_SCALE >= 2.0)
#define IS_IPHONE_4S            (IS_IPHONE && SCREEN_HEIGHT <  568.0)
#define IS_IPHONE_5             (IS_IPHONE && SCREEN_HEIGHT == 568.0)
#define IS_IPHONE_6             (IS_IPHONE && SCREEN_WIDTH  == 375.0)
#define IS_IPHONE_6P            (IS_IPHONE && SCREEN_WIDTH  == 414.0)

#define APP_VERSION             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]      //App版本号
#define IOS_VERSION             [UIDevice currentDevice] systemVersion]                                       //当前IOS版本
#define APP_DELEGATE            ((AppDelegate *)[[UIApplication sharedApplication] delegate])                 //AppDelegate


#define COLOR_RGB(r,g,b)        [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]    //RGB 色值
#define COLOR_RGBA(r,g,b,a)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]  //RGB 色值
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define DEGREES_TO_RADIANS(d)   ((d) * M_PI / 180.0)
#define RADIANS_TO_DEGREES(r)   ((d) * 180.0 / M_PI)

#define WeakSelf(weakSelf)      __weak __typeof(&*self)weakSelf = self;    //获取弱引用self

#define PHONENUMBER_TAG         999                                        //默认打开电话的标签
#define BASEVIEWCOLOR           COLOR_RGB(248,248,248)                     //所有继承view的基础颜色





#endif
