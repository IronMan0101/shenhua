//
//  ProductListCell.h
//  ShenHua
//
//  Created by suzhiqiu on 2017/2/25.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ProductListCellDelegate <NSObject>

@optional

-(void)clickLike;

@end

@interface ProductListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIButton *btnLike;
@property (weak, nonatomic) id<ProductListCellDelegate> delegate;


@property(nonatomic,copy) NSString *name;
- (IBAction)clickLike:(id)sender;



@end



