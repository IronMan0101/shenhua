//
//  TestViewController.h
//  ShenHua
//
//  Created by suzhiqiu on 2017/1/31.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface TestViewController : UIViewController

@property(nonatomic,strong) NSMutableArray *arrayLabel;
@property(nonatomic,strong) Person *person;


@property(nonatomic,strong) IBOutlet UIButton *addBtn;
@property(nonatomic,strong) IBOutlet UIButton *deleteBtn;
@property(nonatomic,strong) IBOutlet UILabel *lbl1;
@property(nonatomic,strong) IBOutlet UILabel *lbl2;
@property(nonatomic,strong) IBOutlet UILabel *lbl3;
@property(nonatomic,strong) IBOutlet UILabel *lbl4;
@property(nonatomic,strong) IBOutlet UILabel *lbl5;
@property(nonatomic,strong) IBOutlet UILabel *lbl6;

-(IBAction)click1:(id)sender;
-(IBAction)click2:(id)sender;

@end
