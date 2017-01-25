//
//  sliderChooseView.m
//  HeDM
//
//  Created by suzhiqiu on 14-7-10.
//  Copyright (c) 2014年 suzhiqiu. All rights reserved.
//

#import "BCScrollView.h"


@implementation BCScrollView


#define BTN_START_INDEX  100
#define BUTTONID(tag) (tag-100)

- (id)initWithFrame:(CGRect)frame  param:(NSDictionary *)param
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
         [self initParam:param];
    }
    return self;
}



-(void)initParam:(NSDictionary *)param
{
    
  
    //self.backgroundColor = [UIColor clearColor];



    
    UIColor  *btnColorNormal;
    UIColor  *btnColorSelect;
    NSInteger btnFontSize=15;
    UIFont    *btnFont=[UIFont systemFontOfSize:15];
    GLfloat   btnWith=26;
    GLfloat   btnHeight=40;
    GLfloat   btnGap=50;
    NSString *imageSliderBg;
    GLfloat   scrollBeginLeft = 0.0f;
    
    NSArray *btArrayTitle=[param objectForKey:@"btn_array_title"];
    if (!btArrayTitle)
    {
        return;//一个都没有直接return
    }
  


    btnColorNormal=[param objectForKey:@"btn_color_normal"];//普通字体颜色
    if (!btnColorNormal)
    {
        btnColorNormal=UIColorFromRGB(0x666666);
    }
    
    btnColorSelect=[param objectForKey:@"btn_color_select"];//选中字体颜色
    if (!btnColorSelect)
    {
        btnColorSelect=UIColorFromRGB(0x1699fe);
    }
    
    
    if ([param objectForKey:@"btn_font_size"])              //字体大小
    {
        btnFontSize=[[param objectForKey:@"btn_font_size"] integerValue];
        btnFont=[UIFont systemFontOfSize:btnFontSize];
        
    }
    
    
    if ([param objectForKey:@"btn_with"])                   //按钮宽度
    {
        btnWith=[[param objectForKey:@"btn_with"] floatValue];
    }
    
    btnHeight=self.frame.size.height;                       //按钮高度

    
    
    if ([param objectForKey:@"btn_gap"])                    //按钮间隔
    {
        btnGap=[[param objectForKey:@"btn_gap"] floatValue];
    }
    
    
    imageSliderBg=[param objectForKey:@"image_slider_bg"]; //滑块背景
    
    if (!imageSliderBg)
    {
        imageSliderBg=@"";
    }
    
    
    if ([param objectForKey:@"scroll_begin_left"])         //滚动条一开始的偏移左边
    {
        scrollBeginLeft=[[param objectForKey:@"scroll_begin_left"] floatValue];
    }

    //生成scrollview部分
    _scrollView= [[UIScrollView alloc] initWithFrame:CGRectMake(scrollBeginLeft, 0, self.frame.size.width-scrollBeginLeft, self.frame.size.height)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    
 
    
  //  self.scrollView.contentSize = CGSizeMake((btnWith+btnGap)*[btArrayTitle count]-btnGap, self.frame.size.height); //算出总容量

    //处理按钮部分
    for (int i = 0; i < [btArrayTitle count]; i++)
    {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake((btnWith+btnGap)*i,0,btnWith,btnHeight)];
        [button setTag:i+BTN_START_INDEX];
        
        //默认选中第一个类型
        if (i == 0)
        {
            button.selected = YES;
        }
        
        [button setTitle:[NSString stringWithFormat:@"%@",[btArrayTitle objectAtIndex:i]] forState:UIControlStateNormal];
         button.titleLabel.font = btnFont;
        [button setTitleColor:btnColorNormal forState:UIControlStateNormal];
        [button setTitleColor:btnColorSelect forState:UIControlStateSelected];
        [button addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        
    }
    
    self.scrollView.contentSize = CGSizeMake((btnWith+btnGap)*[btArrayTitle count]-btnGap, self.frame.size.height); //算出总容量

    //处理滑块页面
    self.shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,btnWith,btnHeight)];           
    [self.shadowImageView setImage:[UIImage imageNamed:imageSliderBg]];
    [self.scrollView addSubview:self.shadowImageView];
    
    
       [self addSubview:self.scrollView];

    
}








-(void)clickButton:(UIButton *)sender  bRefreshData:(BOOL)bRefreshData
{
//    self.shadowImageView.hidden=NO;
//    
//   // [self adjustScrollViewContentX:sender];//先矫正按钮的位置
//    //å NSLog(@"当前::%ld",sender.tag);
//    
//    if(self.selecteTag == 0 || sender.tag == 0)
//    {
//        return;
//    }
//    if (sender.tag != self.selecteTag)
//    {
//        
//        UIButton *lastButton = (UIButton *)[self viewWithTag:self.selecteTag];//获取之前选中按钮
//        
//        
//        //NSLog(@"self.selecteTag之前::%ld",self.selecteTag);
//        
//        lastButton.selected = NO;     //去掉之前按钮高亮
//        sender.selected = YES;        //当前按钮高亮
//        self.selecteTag = sender.tag; //保存当前选择
//        
//        //NSLog(@"self.selecteTag之后::%ld",self.selecteTag);
//        
//        //滑块开始移动
//        
//        CGRect shadowFrame=self.shadowImageView.frame;
//        shadowFrame.origin.x=sender.frame.origin.x;
//        
//        [UIView animateWithDuration:0 animations:^{
//            
//            self.shadowImageView.frame=shadowFrame;
//            
//        } completion:^(BOOL finished)
//         {
//             if (finished &&  bRefreshData)
//             {
//              //   [self.sliderChooseViewDelegate clickAtIndex:self.tag index:BUTTONID(sender.tag)];
//             }
//         }];
//        
//    }
//    //重复点击选中按钮
//    else
//    {
//        NSLog(@"重复点击....");
//        sender.selected = YES;
//    }
    
}

- (void)selectButton:(UIButton *)sender
{
    self.shadowImageView.hidden=NO;//去除隐藏
    
    [self  clickButton:sender  bRefreshData:YES];
}


//- (void)adjustScrollViewContentX:(UIButton *)sender
//{
//    
//    //    NSLog(@"sender.frame.origin.x:: %f,self.contentOffset.x:: %f",sender.frame.origin.x,self.contentOffset.x);
//    NSLog(@"contentOffset::%f,sender::%f",self.contentOffset.x,sender.frame.origin.x);
//    
//    
//    //调整左边 剩下距离 至少能够  一个空白 并且最后一个不移动
//    GLfloat  btnPos=self.frame.size.width-(sender.frame.origin.x+self.btnWith - self.contentOffset.x);
//    GLfloat  contentMove=self.contentOffset.x+self.btnWith+self.btnGap-btnPos;
//    
//    
//    if ( BUTTONID(sender.tag)!=self.btnNum-1  &&           //不是最后一个
//        sender.frame.origin.x>self.contentOffset.x &&
//        btnPos<self.btnWith+self.btnGap   )//-4
//    {
//        NSLog(@"左边调整");
//        [self setContentOffset:CGPointMake(contentMove, 0)  animated:YES];
//        
//    }
//    
//    
//    //调整右边 剩下距离 至少能够  一个空白 并且第一个不移动
//    GLfloat  btnRightPos=sender.frame.origin.x-self.contentOffset.x;
//    GLfloat  contentRightMove=self.contentOffset.x-(self.btnWith+self.btnGap)+btnRightPos;
//    
//    NSLog(@"self.contentOffset.x:%f,btnRightPos:%f,contentRightMove:%f",self.contentOffset.x,btnRightPos,contentRightMove);
//    
//    if ( BUTTONID(sender.tag)!=0  &&       //不是第一个
//        btnRightPos<self.btnWith+self.btnGap &&
//        btnRightPos>=(0-self.btnWith-self.btnGap)  &&
//        contentRightMove>=0
//        )
//    {
//        NSLog(@"右边调整");
//        [self setContentOffset:CGPointMake(contentRightMove, 0)  animated:YES];
//    }
//    
//}
//
////移除所有选中
//-(void)removeAllSelect
//{
//    for (int i = 0; i < [self.arrayTitle count]; i++)
//    {
//        
//        UIButton *button = (UIButton *)[self viewWithTag:i+100];
//        
//        button.selected = NO;     //去掉之前按钮高亮
//     }
//    
//    self.shadowImageView.hidden=YES;
//}
//
////每次都是作为第一个出现
//-(void)moveFirst:(UIButton *)sender  bRefreshData:(BOOL)bRefreshData
//{
//    self.shadowImageView.hidden=NO;
//    
//    NSLog(@"%@",NSStringFromCGRect( sender.frame));
//    NSLog(@"start %@",NSStringFromCGRect(self.shadowImageView.frame));
//    
//    if(!bRefreshData)
//        //默认滑块在第一个类型下
//        [self setContentOffset:CGPointMake(sender.frame.origin.x, 0)  animated:YES];
//
//    if(self.selecteTag == 0 || sender.tag == 0)
//    {
//        return;
//    }
//    NSLog(@"sender.tag %ld",(long)sender.tag);
//    if (sender.tag != self.selecteTag || bRefreshData)
//    {
//        
//        UIButton *lastButton = (UIButton *)[self viewWithTag:self.selecteTag];//获取之前选中按钮
//        
//        
//        //NSLog(@"self.selecteTag之前::%ld",self.selecteTag);
//        
//        lastButton.selected = NO;     //去掉之前按钮高亮
//        sender.selected = YES;        //当前按钮高亮
//        self.selecteTag = sender.tag; //保存当前选择
//        
//        //滑块开始移动
//        
//        CGRect shadowFrame=self.shadowImageView.frame;
//        shadowFrame.origin.x=sender.frame.origin.x;
//        self.shadowImageView.frame=shadowFrame;
//        
//        if (bRefreshData)
//        {
//            [self.sliderChooseViewDelegate clickAtIndex:self.tag index:BUTTONID(sender.tag)];
//            
//        }
//        NSLog(@"end %@",NSStringFromCGRect(self.shadowImageView.frame));
//    }
//    //重复点击选中按钮
//    else
//    {
//        NSLog(@"重复点击2....");
//        sender.selected = YES;
//    }
//}


@end
