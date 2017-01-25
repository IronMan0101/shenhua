//
//  TestViewController.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/8.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//  http://segmentfault.com/a/1190000002473595

//技术测试类

//博客
//土哥哥的博客
//http://tutuge.me/
#import "TestViewController.h"
#import "Category/HeadSDCategory.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self performSelector:@selector(testPerform) withObject:nil afterDelay:4];
    
    [self.view sd_logFrame:@"测试"];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSString *strString=@"www.taobao.com";
    strString=@"https://www.baidu.com";
   // strString=@"https://m.fanhuan.com/fanhuan/fhsearch?keyword=%E9%A3%9F%E5%93%81";
    
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:strString]];
    
    [self.view addSubview: self.webView];
    [self.webView loadRequest:request];
    
    NSMutableArray *array=[NSMutableArray  arrayWithCapacity:10];
    
    [array count];
    
    
 
    
}


-(void)viewDidLayoutSubviews
{
     self.webView.frame = self.view.bounds;
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

-(void)testPerform
{
    NSLog(@"testPerform");
    NSLog(@"");
}

-(void)dealloc
{
    [self.webView stopLoading];
    [self.webView loadHTMLString:@"" baseURL:nil];
    
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    self.webView.dataDetectorTypes = UIDataDetectorTypeNone;
    
    self.webView.delegate = nil;
    self.webView.scrollView.delegate = nil;
    [self.webView removeFromSuperview];
    self.webView = nil;
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [[NSURLCache sharedURLCache] setDiskCapacity:0];
    [[NSURLCache sharedURLCache] setMemoryCapacity:0];
    
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    

    

    
    NSLog(@"dealloc");
    NSLog(@"");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
