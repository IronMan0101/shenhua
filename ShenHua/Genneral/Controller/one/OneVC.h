//
//  OneVC.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/7.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "BaseViewController.h"

@interface OneVC : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy) NSMutableArray *list;
@property(nonatomic,strong) UITableView *tableView;

@end
