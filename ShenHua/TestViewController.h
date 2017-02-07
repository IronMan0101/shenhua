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

-(IBAction)click1:(id)sender;
-(IBAction)click2:(id)sender;

@end
