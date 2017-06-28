//
//  AnimCaseVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/18.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "AnimCaseVC.h"

@interface AnimCaseVC ()

@end

@implementation AnimCaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.lblText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
        
    }];
    
    self.lblText.backgroundColor=[UIColor redColor];
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

- (IBAction)clickAnimi:(id)sender
{
    
}

@end
