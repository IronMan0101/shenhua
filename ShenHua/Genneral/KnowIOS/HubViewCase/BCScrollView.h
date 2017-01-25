//
//  sliderChooseView.h
//  HeDM
//
//  Created by suzhiqiu on 14-7-10.
//  Copyright (c) 2014年 suzhiqiu. All rights reserved.
//  通用滑块视图
//
#import <UIKit/UIKit.h>

@protocol BCScrollViewDelegate <NSObject>

-(void)clickAtIndexByBCScrollView:(NSInteger)btnIndex;

@end



@interface BCScrollView : UIView <UIScrollViewDelegate>
{
}

@property (nonatomic, strong) UIScrollView *scrollView;           //滚动视图
@property (nonatomic, strong) UIImageView *shadowImageView;       //滑块视图
@property (nonatomic, weak)   id<BCScrollViewDelegate>  delegate; //代理

//初始化界面参数
- (id)initWithFrame:(CGRect)frame  param:(NSDictionary *)param;



-(void)clickButton:(UIButton *)sender  bRefreshData:(BOOL)bRefreshData;

@end
