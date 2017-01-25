//
//  HubViewCaseVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/19.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "HubViewCaseVC.h"

#import "BCScrollView.h"

@interface HubViewCaseVC ()

@end

@implementation HubViewCaseVC


-(UIColor *)hexStrToColor:(NSString *)strHex
{
    strHex = [strHex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    NSInteger len=[strHex length];
    
    if (len!=6)
    {
        return  nil;
    }
    
    NSLog(@"strHex::%@",strHex);
    
    GLfloat  red = strtoul([[strHex substringWithRange:NSMakeRange(0, 2)] UTF8String],0,16);
    GLfloat  green = strtoul([[strHex substringWithRange:NSMakeRange(2, 2)] UTF8String],0,16);
    GLfloat  blue = strtoul([[strHex substringWithRange:NSMakeRange(4, 2)] UTF8String],0,16);
    
    NSLog(@"%f,%f,%f",red,green,blue);
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}


-(GLfloat)addHeadSilderView:(GLfloat)offsetY
{
    

    
    
    
    GLfloat bcScrollHeight=40;//高度
    GLfloat bcScrollRight=45; //距离左边
    
    //总的topView
    UIView *topScrollView=[[UIView alloc] initWithFrame:CGRectMake(0, offsetY, SCREEN_WIDTH, bcScrollHeight)];
    topScrollView.backgroundColor= [UIColor greenColor];
    
    
    
    UIColor  *btnColorNormal=UIColorFromRGB(0x666666);        //普通字体颜色
    UIColor  *btnColorSelect=UIColorFromRGB(0x1699fe);        //选中字体颜色
    NSInteger btnFontSize=16;                                 //字体大小
    GLfloat   btnWith=36.0f;                                  //按钮大小
    GLfloat   btnGap= 26.0f;                                  //按钮间隔
    NSArray  *btArrayTitle= [NSArray arrayWithObjects:@"全部",@"女装",@"男装",@"居家",@"零食",@"美妆",@"家电",@"母婴",@"运动",nil];//标题的文字
    NSString *imageSliderBg=@"cgf_classification_line";       //滑块背景
    GLfloat   scrollBeginLeft=10.0f;                          //滚动条一开始的偏移左边
    
    
    
    
    NSDictionary * param = [NSDictionary dictionaryWithObjectsAndKeys:btnColorNormal, @"btn_color_normal",
                            btnColorSelect, @"btn_color_select",
                            [NSNumber numberWithInteger:btnFontSize],  @"btn_font_size",
                            [NSNumber numberWithFloat:btnWith],        @"btn_with",
                            [NSNumber numberWithFloat:btnGap],         @"btn_gap",
                            btArrayTitle,   @"btn_array_title",
                            imageSliderBg,  @"image_slider_bg",
                            [NSNumber numberWithFloat:scrollBeginLeft],@"scroll_begin_left",
                            nil];
    
    //添加真正滚动条
    BCScrollView *bcScrollView=[[BCScrollView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH-bcScrollRight,bcScrollHeight) param:param];
  //  bcScrollView.delegate=self;
    bcScrollView.backgroundColor=[UIColor redColor];
    [topScrollView addSubview:bcScrollView];
    
    
    NSLog(@"%@",NSStringFromCGSize( bcScrollView.scrollView.contentSize));
    NSLog(@"");
    
    //    //添加分隔线
    //    UIImageView *imgvSep= [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-bcScrollRight+1, 10, 0.5, 20)];
    //    imgvSep.backgroundColor=UIColorFromRGB(0xeeeeee);
    //    [topScrollView  addSubview:imgvSep];
    //
    //    //添加箭头
    //    GLfloat btnArrowW=16;
    //    GLfloat btnArrowH=9;
    //    GLfloat btnArrowX=SCREEN_WIDTH-bcScrollRight+  (bcScrollRight-btnArrowW)/2;
    //    GLfloat btnArrowY=(bcScrollRight-btnArrowH)/2;
    //
    //    UIButton *btnArrow= [[UIButton alloc] initWithFrame:CGRectMake(btnArrowX,btnArrowY,btnArrowW,btnArrowH)];
    //    [btnArrow setImage:[UIImage imageNamed:@"cgf_classification_open"] forState:UIControlStateNormal];
    //    [topScrollView  addSubview:btnArrow];
    //
    //
    [self.view  addSubview:topScrollView];
    
    
    return  offsetY+bcScrollHeight+5;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addHeadSilderView:64];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnLogin:(id)sender
{
//    [Toast showWithHub:@"正在登陆..."];
//    
//    HDMChannelTagManager*  _manager = [[HDMChannelTagManager alloc] initWithParameter:nil];
//    _manager.channel =2;
//    [_manager enquiryListSuccess:^(NSDictionary *codeMsg) {
//        
//        NSLog(@"success");
//        [Toast hideWithHub];
//        //[Toast show:@"登陆成功!"];
//        //[Toast showSuccess:@"登陆成功!"];
//        [Toast showError:@"网络连接超时!!!"];
//        
//    } Failure:^(NSDictionary *codeMsg)
//     {
//        // NSLog(@"获取菜单失败");
//         //   [HDMPushData sharedInstance].pushChannelState = PushChannelStateDefault;
//     }];
    
   // [Util openURL:@"www.baidu.com"];
    [Tool openCALL:self.view phoneNumber:@"18205957502"];
}

@end
