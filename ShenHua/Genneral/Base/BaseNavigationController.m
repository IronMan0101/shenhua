//
//  BaseNavigationController.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/7.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
    
    
}

///**
// *  控制旋转
// */
//-(BOOL)shouldAutorotate
//{
//    return YES;
//}
//
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return [self.viewControllers.lastObject supportedInterfaceOrientations];
//}
//
//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
//}


-(void)clickBack
{
    [self popViewControllerAnimated:YES];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"%ld",self.viewControllers.count);
    NSLog(@"");
  
    if(self.viewControllers.count > 0)
    {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
        btn.frame=CGRectMake(0, 0, 50, 50);
        btn.backgroundColor=[UIColor redColor];
        UIBarButtonItem *bar=[[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.navigationItem.leftBarButtonItem=bar;
    }
    
    
//    if (self.viewControllers.count > 0)
//    {
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//    else
//    {
//        viewController.hidesBottomBarWhenPushed = NO;
//    }
//
      [super pushViewController:viewController animated:animated];
}

@end
