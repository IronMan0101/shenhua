//
//  SDGuideViewController.m
//  ShenHua
//
//  Created by suzq on 16/2/19.
//  Copyright © 2016年 suzhiqiu. All rights reserved.
//

#import "SDGuideViewController.h"
#import "LocateCityCommand.h"

@interface SDGuideViewController ()

@end

@implementation SDGuideViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {

        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   
    [self initView];
   
     //[self iniPageInfo];
    

}

-(void)viewDidLayoutSubviews
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidAppear:(BOOL)animated
{
    
}
//初始化view
-(void)initView
{

    self.guideScrollView.delegate = self;
    self.guideScrollView.backgroundColor = [UIColor clearColor];
    self.guideScrollView.showsVerticalScrollIndicator = NO;
    self.guideScrollView.showsHorizontalScrollIndicator = NO;
    self.guideScrollView.bounces = NO;
    self.guideScrollView.pagingEnabled = YES;
    self.guideScrollView.scrollsToTop = NO;
    self.guideScrollView.userInteractionEnabled = YES;
    self.guideScrollView.tag = 10000;
    
   // [self.view addSubview:self.guideScrollView];
    
    
    self.guideScrollView.contentSize=CGSizeMake(self.pageCount*SCREEN_WIDTH, SCREEN_HEIGHT);
    
    for (int i = 0; i<self.pageCount; i++)
    {
        
        NSString *imageName  = [NSString stringWithFormat:@"%@_%d",self.arrayImageName, i+1];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        //最后一页
        if (i == self.pageCount-1)
        {
            
            UIButton *enterButton = [[UIButton alloc] initWithFrame:CGRectZero];
            [enterButton setImage:[UIImage imageNamed:self.enterImageName] forState:UIControlStateNormal];
            [enterButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
            enterButton.tag =2;
            enterButton.frame = CGRectMake((SCREEN_WIDTH-96)/2, SCREEN_HEIGHT-100, 96, 34);
            enterButton.backgroundColor = [UIColor clearColor];
            enterButton.backgroundColor=[UIColor greenColor];
            imageView.userInteractionEnabled=YES;//要设置
            [imageView addSubview:enterButton];
        }
        [self.guideScrollView addSubview:imageView];
        
        
    }

    
}

//设置完成的block
//- (void)setDismissBlock:(SDBasicBlock)block
//{
//    if (block != self.dismissBlock)
//    {
//        self.dismissBlock = [block copy];
//    }
//}
//消息页面的动画
- (void)dismissView{
    
    CGContextRef contentext = UIGraphicsGetCurrentContext();
    
    [UIView beginAnimations:nil context:contentext];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    [UIView setAnimationDuration:0.4];
    
    self.view.transform = CGAffineTransformMakeTranslation(-SCREEN_WIDTH, 0);
    
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    
    [UIView commitAnimations];
    
}
//完成动画
- (void)animationFinished:(id)sender
{
    [self goBack];
}

//返回
- (void)goBack
{
    [self.view removeFromSuperview];
    
//    if (self.dismissBlock)
//    {
//        self.dismissBlock();
//    }
}

//设置页面信息
-(void)iniPageInfo
{
   // [self  iniPageInfo:nil];
}
////设置页面信息
//-(void)iniPageInfo:(SDBasicBlock)block
//{
//    return  [self  iniPageInfo:kGuidePageCount arrayImageName:kGuideArrayImageName enterImageName:kGuideEnterBtnImageName enterBlock:block];
//}
////设置页面信息
//-(void)iniPageInfo:(NSInteger)pageCount  arrayImageName:(NSString *)arrayImageName  enterImageName:(NSString *)enterImageName  enterBlock:(SDBasicBlock)block
//{
//    self.pageCount=pageCount;
//    self.arrayImageName=arrayImageName;
//    self.enterImageName=enterImageName;
//    self.dismissBlock=block;
//    
//}
//
//
//
////显示在新的window层
//- (void)showOnWindow
//{
//    CGRect frame = [UIScreen mainScreen].bounds;
//    if (!IOS7_OR_LATER) {
//        frame.origin.y = 20;
//        frame.size.height-=20;
//    }
//    self.view.frame = frame;
//    
//    if (!self.guideWindow)
//    {
//        self.guideWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        self.guideWindow.windowLevel = UIWindowLevelStatusBar+kGuideWindowLeavel;
//        self.guideWindow.backgroundColor = [UIColor clearColor];
//        self.guideWindow.hidden = NO;
//        [self.guideWindow makeKeyAndVisible];
//        
//    }
//    
//    [self.guideWindow addSubview:self.view];
//}


#pragma mark -
#pragma mark Paging and Refresh image view

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > 40)
    {
        scrollView.bounces = YES;
    }
    else
    {
        scrollView.bounces = NO;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat space = scrollView.contentOffset.x - scrollView.sd_width*(self.pageCount-1);
    if (space > 40)
    {
        [self dismissView];
    }
}


- (void)showOnWindow
{
    
}



@end
