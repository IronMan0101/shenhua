//
//  ProductListTwoCell.m
//  ShenHua
//
//  Created by suzhiqiu on 2017/2/25.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "ProductListTwoCell.h"

@implementation ProductListTwoCell

-(void)setName:(NSString *)text
{
    self.textLabel.text=text;
    self.detailTextLabel.text=text;
}

@end
