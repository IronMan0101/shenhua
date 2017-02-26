//
//  ProductListCell.m
//  ShenHua
//
//  Created by suzhiqiu on 2017/2/25.
//  Copyright © 2017年 suzhiqiu. All rights reserved.
//

#import "ProductListCell.h"

@implementation ProductListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setName:(NSString *)text
{
    _name=text;
    self.lblName.text=text;
    
}

- (IBAction)clickLike:(id)sender
{
    if(self.delegate && [self.delegate  respondsToSelector:@selector(clickLike)])
    {
        [self.delegate clickLike];
    }
}
@end
