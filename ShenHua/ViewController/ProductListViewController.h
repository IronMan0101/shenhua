//
//  ProductListViewController.h
//  ShenHua
//
//  Created by suzq on 2017/2/17.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductListCell.h"
#import "ProductListTwoCell.h"

@interface ProductListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ProductListCellDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *arrayData;

- (IBAction)clickDetail:(id)sender;

@end
