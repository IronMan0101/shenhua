//
//  ProductModel.h
//  ShenHua
//
//  Created by suzq on 2017/2/17.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject <NSCoding,NSCopying>


@property(nonatomic,copy) NSString *title;//产品标题
@property(nonatomic,copy) NSString *image;//产品图片
@property  NSString * oldPrice;

-(void)log;
-(void)log:(NSString *)text;



@end
