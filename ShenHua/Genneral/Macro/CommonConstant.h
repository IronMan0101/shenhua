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
#define STATUSBAR_HEIGHT        20                                         //状态栏高度
#define NAVBAR_HEIGHT           44                                         //UINavgationbar高度
#define TABBAR_HEIGHT           49                                         //UITabbBar高度
#define LABEL_HEIGHT            21                                         //默认UILabel高度
#define CELL_HEIGHT             44                                         //默认cell高度

#define RGB(A,B,C)               [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]      //RGB值
#define RGBL(A,B,C,L)            [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:L]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#define APP_VERSION             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]  //App版本号
#define APP_DELEGATE            ((AppDelegate *)[[UIApplication sharedApplication] delegate])             //AppDelegate
#define IS_IPAD                 ( UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad )                    //是否为iPad

#define PHONENUMBER_TAG         999                                        //默认打开电话的标签
#define BASEVIEWCOLOR           RGB(248,248,248)                           //所有继承view的基础颜色
#define WeakSelf(weakSelf)      __weak __typeof(&*self)weakSelf = self;    //获取弱引用self
#define DEGREES_TO_RADIANS(d)  ((d) * M_PI / 180.0)
#define RADIANS_TO_DEGREES(r)  ((d) * 180.0 / M_PI)




#endif
