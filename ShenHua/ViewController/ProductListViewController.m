//
//  ProductListViewController.m
//  ShenHua
//
//  Created by suzq on 2017/2/17.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductDetailViewController.h"

@interface ProductListViewController ()

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sendNotify
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"First" object:@"博客园"];

    
    NSDictionary*dict=[[NSDictionary alloc]initWithObjects:@[@"keso"] forKeys:@[@"key"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Second"object:@"http://www.cnblogs.com" userInfo:dict];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickDetail:(id)sender
{
//    UIButton *btn=[[UIButton  alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
//    bt
//    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    backItem.title = @"你妹";
//    self.navigationItem.backBarButtonItem = backItem;
    
    ProductDetailViewController * detailVC= [[ProductDetailViewController alloc] initWithNibName:@"ProductDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
