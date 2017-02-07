//
//  Persion.m
//  ShenHua
//
//  Created by suzhiqiu on 2017/2/5.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id) init
{
    if(self = [super init])
    {
        _dog=[[Dog alloc] init];
    }
    return self; 
}


@end
