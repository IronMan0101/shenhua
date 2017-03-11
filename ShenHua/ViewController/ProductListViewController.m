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

#define ProductListCell_ID  @"ProductListCell_ID"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    self.tableView= [[UITableView alloc] init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    //self.tableView.allowsSelection=NO;//非编辑模式是否允许选中
    //self.tableView.allowsMultipleSelection=YES;//非编辑模式
    //self.tableView.allowsMultipleSelectionDuringEditing=YES;//编辑模式下可以多选
    //self.tableView.allowsSelectionDuringEditing=YES;//编辑模式下单选
    //[self.tableView setEditing:YES animated:YES];
    //self.tableView.isEditing
   // NSLog(@"是否可编辑:%lu",self.tableView.isEditing);
    

    
 
   [self.view addSubview:self.tableView];
    
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
    
    self.automaticallyAdjustsScrollViewInsets=YES;
    
  //  [self.tableView registerClass:[ProductListTwoCell class] forCellReuseIdentifier:ProductListCell_ID];
    
//    //制作约束
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make)
//     {
//         make.edges.equalTo(self.view);              //跟view一样宽高
//     }];
    
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 600, 44)];
    btn.backgroundColor=[UIColor redColor];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=leftBarItem;
    NSLog(@"%@", self.navigationItem.leftBarButtonItem);
    NSLog(@"");
//    

}

-(void)viewDidLayoutSubviews
{
    NSLog(@"%s",__func__);
     NSLog(@"self.navigationItem:%@",self.navigationController.navigationBar);
    NSLog(@"self.navigationItem:%@",self.navigationController.navigationItem);
    NSLog(@"self.navigationItem.titleView:%@",self.navigationController.navigationItem.titleView);
    NSLog(@"self.navigationItem.backBarButtonItem:%@",self.navigationController.navigationItem.backBarButtonItem);
    NSLog(@"self.navigationItem.leftBarButtonItem:%@",self.navigationController.navigationItem.leftBarButtonItem);
    
    //self.tableView.frame=[self.view sd_setY:64];
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

//cell代理
-(void)clickLike
{
    NSLog(@"代理啦");
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%s",__func__);
    ProductDetailViewController * runVC=[[ProductDetailViewController alloc] initWithNibName:@"ProductDetailViewController" bundle:nil];
    runVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:runVC animated:YES];
}




//默认显示的删除,但是标题可以改。 设置更多的滑块，执行方法也不再这里了
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    
    [self.tableView beginUpdates];

    [self.arrayData removeObjectAtIndex:indexPath.row];
    
    NSArray * arrayIndex=@[indexPath];
    [tableView deleteRowsAtIndexPaths:arrayIndex withRowAnimation:UITableViewRowAnimationRight];
    
    [self.tableView endUpdates];
}


//自定义默认删除的标题
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    return @"你妹";
}
//判断是否能够编辑方法
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

// 自定义左滑显示编辑按钮
-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                         title:@"跟进" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                             NSLog(@"跟进");
                                                                             
                                                                         }];
    
    UITableViewRowAction *rowActionSec = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                            title:@"快速备忘"    handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                                NSLog(@"快速备忘");
                                                                                
                                                                            }];
    
    UITableViewRowAction  *rowActionThree= [UITableViewRowAction  rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"你妹" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"这个什么鬼");
    }];
    
    rowActionSec.backgroundColor =UIColorFromRGB(0xd9d9d9);
    rowAction.backgroundColor =UIColorFromRGB(0xd9d919);;
    
    NSArray *arr = @[rowAction,rowActionSec,rowActionThree];
    return arr;
}
//


//-(void)loadView
//{
//    [super loadView];
//    UILabel * lbl=[[UILabel alloc] initWithFrame:self.view.bounds];
//    lbl.text=@"菠萝菠萝 我爱菠萝";
//    [self.view addSubview:lbl];
//    NSLog(@"loadView");
//}

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
