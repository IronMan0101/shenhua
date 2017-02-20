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



- (IBAction)click1:(id)sender
{
    
    [self  sendGCD];
}


//发送通知
-(void)sendNotify
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"First" object:@"博客园"];
    
    
    NSDictionary*dict=[[NSDictionary alloc]initWithObjects:@[@"keso"] forKeys:@[@"key"]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Second"object:@"http://www.cnblogs.com" userInfo:dict];
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


//
//发送通知
-(void)sendGCD
{
    //
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        NSLog(@"下载图片");
//        NSURL * url = [NSURL URLWithString:@"https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/crazy_kk_2008/pic/item/b2251bfb9495778f58ee90ef.jpeg"];
//        
//        NSData * data = [[NSData alloc] initWithContentsOfURL:url];
//        
//        UIImage *image = [[UIImage alloc] initWithData:data];
//        
//        if(!data)
//        {
//            return ;
//        }
//    
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            NSLog(@"主线程:%@",image);
//            self.imgv1.image=image;
//            
//        });
//    });
    
    
    dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group= dispatch_group_create();
    
   __block  UIImage *image1;
   __block  UIImage *image2;
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载图片1");
        
        NSURL * url = [NSURL URLWithString:@"https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/crazy_kk_2008/pic/item/b2251bfb9495778f58ee90ef.jpeg"];
        
        NSData * data = [[NSData alloc] initWithContentsOfURL:url];
        
        image1 = [[UIImage alloc] initWithData:data];
        
        if(!data)
        {
            return ;
        }
        NSLog(@"完成下载图片1");
        
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载图片2");
        
        NSURL * url = [NSURL URLWithString:@"https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/crazy_kk_2008/pic/item/b2251bfb9495778f58ee90ef.jpeg"];
        
        NSData * data = [[NSData alloc] initWithContentsOfURL:url];
        
        image2 = [[UIImage alloc] initWithData:data];
        
        if(!data)
        {
            return ;
        }
        NSLog(@"完成下载图片2");
      
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"都完成了1");
        self.imgv1.image=image1;
        self.imgv2.image=image2;
        NSLog(@"都完成了2");
    });
    

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
