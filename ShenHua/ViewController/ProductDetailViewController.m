//
//  ProductDetailViewController.m
//  ShenHua
//
//  Created by suzq on 2017/2/17.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationFirst:) name:@"First"object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationSecond:) name:@"Second"object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




-(void)notificationFirst:(NSNotification *)notification{
    
    NSString*name=[notification name];
    
    NSString*object=[notification object];
    
    NSLog(@"名称:%@----对象:%@",name,object);
    
}

-(void)notificationSecond:(NSNotification *)notification{
    
    NSString*name=[notification name];
    
    NSString*object=[notification object];
    
    NSDictionary*dict=[notification userInfo];
    
    NSLog(@"名称:%@----对象:%@",name,object);
    
    NSLog(@"获取的值:%@",[dict objectForKey:@"key"]);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
