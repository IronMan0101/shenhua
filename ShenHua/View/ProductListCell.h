//
//  ProductListCell.h
//  ShenHua
//
//  Created by suzhiqiu on 2017/2/25.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol ProductListCellDelegate;

@interface ProductListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIButton *btnLike;
@property (weak, nonatomic) ProductListCellDelegate delegate;


@property(nonatomic,copy) NSString *name;
- (IBAction)clickLike:(id)sender;



@end


@protocol ProductListCellDelegate <NSObject>

-(void)clickLike;

@end
