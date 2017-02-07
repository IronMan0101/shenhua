//
//  Persion.h
//  ShenHua
//
//  Created by suzhiqiu on 2017/2/5.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject


@property(nonatomic,copy)  NSString *name;
@property(nonatomic,strong) Dog *dog;

@end
