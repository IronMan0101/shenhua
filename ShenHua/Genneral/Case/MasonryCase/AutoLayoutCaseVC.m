//
//  AutoLayoutCaseVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/13.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "AutoLayoutCaseVC.h"

@interface AutoLayoutCaseVC ()

@end

@implementation AutoLayoutCaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    self.lbl1.hidden=YES;
    self.lbl2.hidden=YES;
    self.lbl3.hidden=YES;
    self.lbl4.hidden=YES;
    self.lbl5.hidden=YES;
    self.lbl6.hidden=YES;
    
    
    self.lbl1.hidden=NO;
    self.lbl2.hidden=NO;
    

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

@end
