//
//  ProductModel.m
//  ShenHua
//
//  Created by suzq on 2017/2/17.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "ProductModel.h"
#import <objc/message.h>

@implementation ProductModel


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
      self.title= [aDecoder decodeObjectForKey:@"title"];
      self.image=[aDecoder decodeObjectForKey:@"image"];
    }
    return self;

    
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.image forKey:@"image"];
    
}


- (id)copyWithZone:(nullable NSZone *)zone
{
    ProductModel *model = [[[self class] allocWithZone:zone] init];
    model.title=[self.title copy];
    model.image=[self.image copy];

    return model;
}


-(void)test
{
    ProductModel * productModel=[[ProductModel alloc] init];
    productModel.title=@"小黄人自行车";
    productModel.image=@"xx";
    
    //立马崩溃  只能存储对象
    // [[NSUserDefaults standardUserDefaults] setObject:productModel forKey:@"STORE_PRODUCT"];
    
    //如果没有实现encoding 也会崩溃，会提示没有实现encodeWithCoder
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:productModel];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"STORE_PRODUCT"];
    
    
    NSData *unData = [[NSUserDefaults standardUserDefaults] objectForKey:@"STORE_PRODUCT"];
    ProductModel * unProductModel=[NSKeyedUnarchiver unarchiveObjectWithData:unData];
    NSLog(@"title:%@",unProductModel.title);
    
    
    ProductModel * productModel1=[[ProductModel alloc] init];
    productModel1.title=@"小黄人自行车";
    productModel1.image=@"xx";
    
    ProductModel * productModel2=[productModel1 copy];
    productModel2.title=@"ofo共享单车";
    NSLog(@"title1:%@  title2:%@",productModel1.title,productModel2.title);
    NSLog(@"");
}

-(void)log
{
    NSLog(@"test log...");
}

-(void)log:(NSString *)text
{
    NSLog(@"%@",text);
}

void addMethod(id self,SEL _cmd)
{
    NSLog(@"isSaleOut");
}

void addMethodText(id self,SEL _cmd,NSString *text)
{
    NSLog(@"isSaleOut:%@",text);
}
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"resolveInstanceMethod::%@",NSStringFromSelector(sel));
    if (sel==NSSelectorFromString(@"isSaleOut"))
    {
        class_addMethod(self, sel,(IMP)addMethod, "v@:");
        return YES;
        
    }else if (sel==NSSelectorFromString(@"isSaleOut:"))
    {
        
        class_addMethod(self, sel,(IMP)addMethodText, "v@:*");
        
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}




@end
