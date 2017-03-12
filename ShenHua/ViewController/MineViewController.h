//
//  MineViewController.h
//  ShenHua
//
//  Created by suzhiqiu on 2017/3/11.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductListCell.h"
#import "ProductListTwoCell.h"


@interface MineViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ProductListCellDelegate>


@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *arrayData;
@property(nonatomic,strong) UIImageView *imgvHeadView;
@property(nonatomic,strong) UIView *stackView;

@end
