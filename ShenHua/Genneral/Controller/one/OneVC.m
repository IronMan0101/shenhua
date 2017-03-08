//
//  OneVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/7.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "OneVC.h"
#import "CacheManager.h"
#import "ProductDetailViewController.h"

@interface OneVC ()

@end

@implementation OneVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView=[[UITableView alloc]  init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    self.tableView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:self.tableView];
    _list=[[NSMutableArray alloc]initWithCapacity:100];
    

    
    for (NSInteger i=0; i<100; i++)
    {
        NSString *str=[NSString stringWithFormat:@"%ld",i];
        [self.list addObject:str];
    }
    
    
    NSString *str= [[CacheManager sharedManager] formatCacheSize];
    DLog(@"%@",str);
    DLog(@"");
    
    
    //制作约束
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.edges.equalTo(self.view);              //跟view一样宽高
    }];

//   self.automaticallyAdjustsScrollViewInsets=NO;//当vc 的第一个subview为scrollview自动调整内边距
//   self.tableView.frame= CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
//   self.tableView.frame= CGRectMake(0, 64, SCREEN_WIDTH, self.view.sd_height-49);
    
    //view      -- {{0, 0}, {320, 519}}
    //tableView -- {{0, 64}, {320, 455}}
    //这个时候scrollview就穿透导航条
    
    
      self.automaticallyAdjustsScrollViewInsets=YES;//当vc 的第一个subview为scrollview自动调整内边距
//    //view      -- {{0, 0}, {320, 519}}
//    //tableView -- {{0, 0}, {320, 519}}
//    
//    self.tableView.contentOffset=CGPointMake(0, 200);
//    NSLog(@"UIEdgeInsets::%@",NSStringFromUIEdgeInsets(self.tableView.contentInset));//{64, 0, 0, 0}
//    NSLog(@"contentOffset::%lf", self.tableView.contentOffset.y);//0
//    NSLog(@"");
}

-(void)viewDidLayoutSubviews
{
    [self.view sd_logFrame:@"view"];                             //{{0, 0}, {320, 519}}
    [self.tableView sd_logFrame:@"tableView"];                   //{{0, 0}, {320, 519}}
    NSLog(@"UIEdgeInsets::%@",NSStringFromUIEdgeInsets(self.tableView.contentInset));//{64, 0, 0, 0}
    NSLog(@"contentOffset::%lf", self.tableView.contentOffset.y);//-64.000000
 
   
   
    NSLog(@"");
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


#pragma mark - 数据源方法
//#pragma mark 返回分组数
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    NSLog(@"计算分组数");
//    return self.list.count;
//}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return  self.list.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
//    NSLog(@"生成单元格(组：%i,行%i)",indexPath.section,indexPath.row);
//    KCContactGroup *group=_contacts[indexPath.section];
//    KCContact *contact=group.contacts[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor=[UIColor greenColor];
    cell.textLabel.text=[self.list objectAtIndex:indexPath.row];
  //  cell.detailTextLabel.text=contact.phoneNumber;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductDetailViewController * runVC=[[ProductDetailViewController alloc] initWithNibName:@"ProductDetailViewController" bundle:nil];
    runVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:runVC animated:YES];
}


@end
