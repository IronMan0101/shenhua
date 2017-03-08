//
//  ProductDetailViewController.m
//  ShenHua
//
//  Created by suzq on 2017/2/17.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

//@property(nonatomic,strong) UIImage *img;

@end

#define ImgURL  @"https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/crazy_kk_2008/pic/item/b2251bfb9495778f58ee90ef.jpeg"

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    UIButton *btn=[[UIButton  alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
//    
//    
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    backItem.title = @"我没";
//    self.navigationItem.backBarButtonItem = backItem;
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


-(void)viewDidLayoutSubviews
{
    NSLog(@"%s",__func__);
    
    NSLog(@"self.navigationItem:%@",self.navigationItem);
    NSLog(@"self.navigationItem.titleView:%@",self.navigationItem.titleView);
    NSLog(@"self.navigationItem.backBarButtonItem:%@",self.navigationItem.backBarButtonItem);
    NSLog(@"self.navigationItem.leftBarButtonItem:%@",self.navigationItem.leftBarButtonItem);
    
    //self.tableView.frame=[self.view sd_setY:64];
}



- (IBAction)click1:(id)sender
{
    
    //[self  sendSwideLoad];
    NSLog(@"%@", [self.view sd_findSubviewWithClass:[UIImageView class]]);
    NSLog(@"1:%lf,2:%lf",self.imgv1.sd_y,self.imgv2.sd_y);
    NSLog(@"");
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


//
//懒加载技术
-(void)sendSwideLoad
{
    self.imgv1.image=self.img;
    
    self.img=self.imgv1.image;
}

-(UIImage *)img   //这个是get方法。方法名如果为getImg 不是get方法。  只能重新一个get或者set
{
    if (!_img)
    {
        NSURL * url = [NSURL URLWithString:ImgURL];
        
        NSData * data = [[NSData alloc] initWithContentsOfURL:url];
        
        _img = [[UIImage alloc] initWithData:data];
 

    }
    return _img;
}

//
//-(void)setImg:(UIImage *)img
//{
//    NSLog(@"设置");
//}



@end
