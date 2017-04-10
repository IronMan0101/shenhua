//
//  MineViewController.m
//  ShenHua
//
//  Created by suzhiqiu on 2017/3/11.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

#define ProductListCell_ID  @"ProductListCell_ID"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    self.tableView.delegate=self;
    self.tableView.dataSource=self;

    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view);
    }];
    
    
    self.arrayData=[[NSMutableArray alloc] initWithCapacity:10];
    
    for (NSInteger i=0; i< 60; i++)
    {
        NSString *str=[NSString stringWithFormat:@"菠萝%ld",i];
        [self.arrayData addObject:str];
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ProductListCell" bundle:nil] forCellReuseIdentifier:ProductListCell_ID];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    //设置导航条或者导航条的控件透明度是没有效果
    //self.navigationController.navigationBar.alpha=0.5;
    //只能通过设置背景
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg"] forBarMetrics:UIBarMetricsDefault];
  //  self.navigationItem.title=@"个人详情页";
    //背景设置nil 系统自动帮你设置一张半透明的图片
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:nil];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
    //self.navigationController.navigationBar.hidden=YES;

    
//    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 600, 44)];
//    btn.backgroundColor=[UIColor redColor];
//    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
//    
//    self.navigationItem.leftBarButtonItem=leftBarItem;
//    NSLog(@"%@", self.navigationItem.leftBarButtonItem);
//    NSLog(@"");
//    //
    UIImageView *imgvHeadView= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    imgvHeadView.image= [UIImage imageNamed:@"myhead_bg"];
    self.tableView.tableHeaderView=imgvHeadView;
}

//懒加载技术
-(UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView= [[UITableView alloc] init];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.arrayData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"计算高:%ld",[indexPath row]);
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductListCell *cell=[tableView dequeueReusableCellWithIdentifier:ProductListCell_ID forIndexPath:indexPath];
    
    //  NSLog(@"%@",cell);
    
    NSString *text= [self.arrayData objectAtIndex:[indexPath row]];
    
    cell.name=text;
    cell.delegate=self;
    //  cell.dele
    
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"");
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"");
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"");
}



@end
