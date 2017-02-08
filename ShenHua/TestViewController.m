//
//  TestViewController.m
//  ShenHua
//
//  Created by suzhiqiu on 2017/1/31.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "TestViewController.h"
#import "CustomView.h"
#import "Test2ViewController.h"


@interface TestViewController ()

@end

@implementation TestViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.arrayLabel=[[NSMutableArray alloc] initWithCapacity:10];
    NSLog(@"%s",__func__);
    
}

//- (void)loadView
//{
//    [super loadView];
//    NSLog(@"%s",__func__);
//}
//
//- (void)viewWillUnload
//{
//    NSLog(@"%s",__func__);
//}
//- (void)viewDidUnload
//{
//    NSLog(@"%s",__func__);
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    NSLog(@"%s",__func__);
//}
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//     NSLog(@"%s",__func__);
//}
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    NSLog(@"%s",__func__);
//}
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    NSLog(@"%s",__func__);
//}
//- (void)viewWillLayoutSubviews
//{
//    [super viewWillLayoutSubviews];
//    NSLog(@"%s",__func__);
//}
//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    NSLog(@"%s",__func__);
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

////1.删除添加view 产生内存问题
//-(IBAction)click1:(id)sender
//{
//    for (NSInteger i=0; i<500; i++)
//    {
//        UIImageView *lbl1=[[UIImageView alloc] initWithFrame:self.view.bounds];
//        
////       NSString *path=  [[NSBundle mainBundle] pathForResource:@"test@2x" ofType:@"png"];
////        lbl1.image= [UIImage imageWithContentsOfFile:path];
//        
//        lbl1.image=[UIImage imageNamed:@"test"];
//        [self.view addSubview:lbl1];
//        [self.arrayLabel addObject:lbl1];
//    }
//    NSLog(@"添加Ok");
//}
//-(IBAction)click2:(id)sender
//{
//    for (UIImageView *lbl in self.arrayLabel)
//    {
//        lbl.image=nil;
//        [lbl removeFromSuperview];
//    }
//    [self.arrayLabel removeAllObjects];
// 
//    
//     NSLog(@"结束Ok");
//}


//-(IBAction)click1:(id)sender
//{
//    for (NSInteger i=0; i<500; i++)
//    {
//        UILabel *lbl1=[[UILabel alloc] initWithFrame:self.view.bounds];
//        [self.view addSubview:lbl1];
//        [lbl1 removeFromSuperview];
//    }
//    NSLog(@"结束");
//}

////3.自定义view的使用
//-(IBAction)click1:(id)sender
//{
//    CustomView *view=[CustomView sd_loadNib];
//    CustomView *view1=[UIView sd_loadNibName:@"CustomView"];
//    CustomView *view2=[CustomView sd_loadNibName:@"CustomView"];
//    [self.view addSubview:view];
//}

//3.kvc和kvo使用
-(IBAction)click1:(id)sender
{
    //kvc
    Person *person=[[Person alloc] init];
    [person.dog setValue:@"旺财1" forKey:@"name"];
    NSLog(@"%@",person.dog.name);
    [person setValue:@"旺财2" forKeyPath :@"dog.name"];
    NSLog(@"%@",person.dog.name);
    NSLog(@"%@",[person valueForKeyPath:@"dog.name"]);
    NSLog(@"");
    
    //kvo
    self.person=[[Person alloc] init];
    
    
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld  context:nil];
    
    self.person.name=@"zhangsan";
    
    self.person.name=@"lisi";

    //[person2 removeObserver:self forKeyPath:@"name" context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@,%@,%@",keyPath,object,change);
    NSLog(@"");
}

-(IBAction)click2:(id)sender
{
   // [self.addBtn sd_logFrame:@"self.addBtn"];
    [self.lbl1 sd_logFrame:@"lable1"];
    [self.lbl2 sd_logFrame:@"lable2"];
    [self.lbl3 sd_logFrame:@"lable3"];
}

@end
