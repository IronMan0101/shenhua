//
//  RunTimeViewController.m
//  ShenHua
//
//  Created by suzhiqiu on 2017/2/26.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "RunTimeViewController.h"
#import <objc/message.h>
#import "ProductModel.h"
#import "UIButton+SDCategory.h"

@interface RunTimeViewController ()

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.name1=nil;
    NSLog(@"%@",self.name1);
    self.name2=NULL;
    NSLog(@"%@",self.name2);
    
   // UILabel * lbl=
   
    Class cls=  NSClassFromString(@"UILabel");
    UILabel *lbl=[[cls alloc] initWithFrame:CGRectMake(20, 30, 100, 30)];
    lbl.text=@"菠萝";
    [self.view addSubview:lbl];
    NSLog(@"UILabel:%@,cls:%@", NSStringFromClass([UILabel class]),cls);
    NSLog(@"");
    
    
    //设置搜索msg 设为no
    ProductModel *model= objc_msgSend(objc_getClass("ProductModel"), sel_registerName("alloc"));
    model=objc_msgSend(model,sel_registerName("init"));

//    objc_msgSend(model, sel_registerName("log"));
//    objc_msgSend(model, @selector(log));
//    objc_msgSend(model, @selector(log:),@"我爱罗");
    
//    [model performSelector:@selector(isSaleOut) withObject:nil];
//    [model performSelector:@selector(isSaleOut:) withObject:@"你妹"];
    
    UIButton *btn= [[UIButton alloc] init];
    btn.type=@"我爱罗";
    NSLog(@"type:%@",btn.type);
    NSLog(@"");
    [btn setTitle:@"谁" forState:UIControlStateNormal];
    
  
    
 //   objc_msgSend();
}

//动态添加属性


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setName3:(NSString *)name3
{
    
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
