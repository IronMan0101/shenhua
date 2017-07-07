//
//  BaseScrollView.h
//  ShenHua
//
//  Created by suzq on 2017/7/7.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

/*主要是对于scrollView和返回手势的冲突处理*/

@interface BaseScrollView : UIScrollView<UIGestureRecognizerDelegate>

@end
