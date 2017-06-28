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
#define HEADSCALEVIEW_H   200
#define HEADSTACKVIEW_H   44
#define TABLEVIEW_DEFAULT_OFFSEY    HEADSCALEVIEW_H+HEADSTACKVIEW_H

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];

    //设置导航条或者导航条的控件透明度是没有效果
    //self.navigationController.navigationBar.alpha=0.5;
    //只能通过设置背景
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg"] forBarMetrics:UIBarMetricsDefault];
    //    self.navigationItem.title=@"个人详情页";
    //    //背景设置nil 系统自动帮你设置一张半透明的图片
    //    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //
    //    [self.navigationController.navigationBar setShadowImage:nil];
    //    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
    //self.navigationController.navigationBar.hidden=YES;
    
    
    //    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 600, 44)];
    //    btn.backgroundColor=[UIColor redColor];
    //    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //
    //    self.navigationItem.leftBarButtonItem=leftBarItem;
    //    NSLog(@"%@", self.navigationItem.leftBarButtonItem);
    //    NSLog(@"");
    //    //
    
//    
//    //HeaderView
//    UIView *headerView=[[UIView alloc] init];
//    headerView.backgroundColor=[UIColor blueColor];
//    self.tableView.tableHeaderView=headerView;
//   // [self.tableView setNeedsLayout];
//    
//    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.top.mas_equalTo(0);
//        make.width.mas_equalTo(self.view);
//        make.height.mas_equalTo(150);
//        
//    }];
//    
//    [self.tableView.tableHeaderView layoutIfNeeded];
//    self.tableView.tableHeaderView=headerView;
    
    
//    //FooterView
//    UIView *footerView=[[UIView alloc] init];
//    footerView.backgroundColor=[UIColor redColor];
//    self.tableView.tableFooterView=footerView;
//  //  [self.tableView.tableFooterView setNeedsLayout];
//    
//    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.top.mas_equalTo(0);
//        make.width.mas_equalTo(self.view);
//        make.height.mas_equalTo(100);
//        
//    }];
//    
//     [self.tableView.tableFooterView layoutIfNeeded];
//     self.tableView.tableFooterView=footerView;
//

    
//    self.tableView.tableHeaderView=imgvHeadView;
    
    
}


-(void)initView
{
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    
    
    
    self.arrayData=[[NSMutableArray alloc] initWithCapacity:10];
    
    for (NSInteger i=0; i< 60; i++)
    {
        NSString *str=[NSString stringWithFormat:@"菠萝%ld",i];
        [self.arrayData addObject:str];
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ProductListCell" bundle:nil] forCellReuseIdentifier:ProductListCell_ID];
    
    
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.imgvHeadView= [[UIImageView alloc] init];
    self.imgvHeadView.image= [UIImage imageNamed:@"myhead_bg"];
    self.imgvHeadView.contentMode=UIViewContentModeScaleAspectFill;
    self.imgvHeadView.clipsToBounds=YES;
    [self.view addSubview:self.imgvHeadView];
    [self.imgvHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(HEADSCALEVIEW_H);
    }];
    
    
    
    self.stackView= [[UIImageView alloc] init];
    self.stackView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:self.stackView];
    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.imgvHeadView.mas_bottom);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(HEADSTACKVIEW_H);
    }];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view);
        
    }];
    
    self.tableView.contentInset=UIEdgeInsetsMake(TABLEVIEW_DEFAULT_OFFSEY, 0, 0, 0);
    
    [self.tableView layoutIfNeeded];
    
    
    UILabel *lblTitle=[[UILabel alloc] init];
    lblTitle.text=@"个人详情页面";
    [lblTitle sizeToFit];//如果没有这个 要设置frame
    lblTitle.textColor= [UIColor colorWithWhite:0 alpha:0];
    self.navigationItem.titleView=lblTitle;
    
    //UIImage *imgBg=[UIImage sd_imageWithColor:[UIColor colorWithWhite:0 alpha:0]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   // NSLog(@"%f",scrollView.contentOffset.y + TABLEVIEW_DEFAULT_OFFSEY);
    CGFloat offsetY=scrollView.contentOffset.y + TABLEVIEW_DEFAULT_OFFSEY;
    

    CGFloat headScaleH=HEADSCALEVIEW_H-offsetY;
    
    if(headScaleH<NAVSTAUSBAR_HEIGHT)
    {
        headScaleH=NAVSTAUSBAR_HEIGHT;
        self.imgvHeadView.hidden=YES;
        
    }else
    {
        self.imgvHeadView.hidden=NO;
    }
    
    [self.imgvHeadView mas_updateConstraints:^(MASConstraintMaker *make) {

        make.height.mas_equalTo(headScaleH);
    }];
    
    //设置导航条的背景色
    CGFloat alpha=(offsetY/(HEADSCALEVIEW_H-NAVSTAUSBAR_HEIGHT))*1;
    
    NSLog(@"alpha::%lf  offset:%lf",alpha,offsetY);
    NSLog(@"");
    
    
    if(alpha>=1)
    {
        alpha=0.98;//让其有点微透明
        
    }else if (alpha<0)
    {
        alpha=0;
    }
    
    //设置导航条的文字颜色
    UILabel *lblTitle=(UILabel *)self.navigationItem.titleView;
    lblTitle.textColor= [UIColor colorWithWhite:0 alpha:alpha];
    
    //设置导航条背景色
    UIColor * colorNavBg=[UIColor colorWithWhite:1 alpha:alpha];
    UIImage * imgNavBg=[UIImage sd_imageWithColor:colorNavBg];
    [self.navigationController.navigationBar setBackgroundImage:imgNavBg forBarMetrics:UIBarMetricsDefault];
}




//懒加载技术
-(UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView= [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
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

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 150;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 150;
//}

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




-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"");
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"");
}



@end
