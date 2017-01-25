//
//  SDGuideViewController.h
//  ShenHua
//
//  Created by suzq on 16/2/19.
//  Copyright © 2016年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>



//用户引导页
@interface SDGuideViewController : BaseViewController<UIScrollViewDelegate>


@property(nonatomic,strong) IBOutlet UIScrollView  *guideScrollView;
@property(nonatomic,assign)  NSInteger  pageCount;
//@property(nonatomic,copy)    SDBasicBlock    dismissBlock;
@property(nonatomic,strong)  UIWindow   *guideWindow; //引导页面windowleavel = uilaertviewleavel
@property(nonatomic,copy)    NSString *    arrayImageName;
@property(nonatomic,copy)    NSString *    enterImageName;

//- (void)setDismissBlock:(SDBasicBlock)block;
//设置页面信息
-(void)iniPageInfo;
//设置页面信息
//-(void)iniPageInfo:(SDBasicBlock)block;
//设置页面信息
//-(void)iniPageInfo:(NSInteger)pageCount  arrayImageName:(NSString *)arrayImageName  enterImageName:(NSString *)enterImageName  enterBlock:(SDBasicBlock)block;
- (void)showOnWindow;//显示在新的window层

@end
