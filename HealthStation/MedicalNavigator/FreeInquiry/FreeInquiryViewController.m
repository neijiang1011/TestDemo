//
//  FreeInquiryViewController.m
//  HealthStation
//
//  Created by chjszx on 2017/2/20.
//  Copyright © 2017年 Changhong. All rights reserved.
//

#import "FreeInquiryViewController.h"
#import "Masonry.h"
#import "POPViewController.h"
#import "aaaViewController.h"
#import "bbbViewController.h"

#define YOffset 64.f

@interface FreeInquiryViewController ()
@property (nonatomic, strong) UITextView *textInput;
@property (nonatomic, strong) UIView *cornerHolder;
@property (nonatomic, strong) UIImageView *image1;
@property (nonatomic, strong) UIImageView *image2;
@property (nonatomic, strong) UIImageView *image3;
@end

@implementation FreeInquiryViewController
-(UIView *)cornerHolder{
    if (_cornerHolder == nil) {
        
        _cornerHolder = [[UIView alloc]initWithFrame:CGRectMake(14, 14+YOffset, self.view.bounds.size.width - 2*14, 268)];
        _cornerHolder.layer.masksToBounds = YES;
        _cornerHolder.layer.cornerRadius = 8.0f;
        _cornerHolder.layer.borderColor = UIColorFromHex(0xcccccc).CGColor;
        _cornerHolder.layer.borderWidth = 2.f;
        
    }
    return _cornerHolder;
}

-(UITextView *)textInput{
    if (_textInput == nil) {
        _textInput = [[UITextView alloc]init];
        _textInput.text = @"tessssttestttt啊啊啊啊啊 啊啊啊啊啊 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
        _textInput.textColor = UIColorFromHex(0x333333);
        _textInput.font = [UIFont systemFontOfSize:14];
    }
    return _textInput;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;//解决textView不靠顶部显示问题。
    
    self.title = @"免费问诊";
    
    self.view.backgroundColor = [UIColor whiteColor];
    //self.view.frame = CGRectMake(0, YOffset+20, SCREENWIDTH, SCREENHEIGHT);
    //    self.textInput.backgroundColor = [UIColor yellowColor];
    [self.cornerHolder addSubview:self.textInput];
    
    __weak __typeof(&*self)weakSelf = self;
    [self.textInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(weakSelf.cornerHolder.bounds.size.width - 2*14, weakSelf.cornerHolder.bounds.size.height - 2*14));
        make.left.equalTo(weakSelf.cornerHolder).with.offset(14);
        make.top.equalTo(weakSelf.cornerHolder).with.offset(14);
    }];
    
    [self.view addSubview:self.cornerHolder];
    
    CGFloat even = self.view.bounds.size.width/3.0;
    CGFloat centerX = even/2.0;
    self.image1 = [[UIImageView alloc]initWithFrame:CGRectMake( 0 ,
                                                               self.cornerHolder.bounds.origin.y + self.cornerHolder.bounds.size.height + 20+YOffset ,
                                                               50, 50)];
    self.image1.center = CGPointMake(centerX, self.image1.center.y);
    self.image1.image = [UIImage imageNamed:@"更多-心电图"];
    //    self.image1.backgroundColor = [UIColor yellowColor];//ttttt
    
    [self.view addSubview:self.image1];
    
    
    
    //    NSLog(@"%@",self.image1.bounds);
    self.image2 = [[UIImageView alloc]initWithFrame:CGRectMake( 120+35 ,
                                                               weakSelf.cornerHolder.bounds.origin.y + weakSelf.cornerHolder.bounds.size.height + 20 + YOffset,
                                                               50, 50)];
    self.image2.center = CGPointMake(even + centerX, self.image2.center.y);
    self.image2.image = [UIImage imageNamed:@"更多-心肺音频"];
    //    self.image2.backgroundColor = [UIColor yellowColor];//ttttt
    
    [self.view addSubview:self.image2];
    
    self.image3 = [[UIImageView alloc]initWithFrame:CGRectMake( 240+35 ,
                                                               weakSelf.cornerHolder.bounds.origin.y + weakSelf.cornerHolder.bounds.size.height + 20 + YOffset,
                                                               50, 50)];
    self.image3.center = CGPointMake(even*2+centerX, self.image3.center.y);
    self.image3.image = [UIImage imageNamed:@"图片"];
    //    self.image3.backgroundColor = [UIColor yellowColor];//ttttt
    
    [self.view addSubview:self.image3];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(35, self.image1.frame.origin.y + self.image1.frame.size.height + 6, 100, 20)];//bounds
    label1.center = CGPointMake(self.image1.center.x, label1.center.y) ;
    label1.font = [UIFont systemFontOfSize:14];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = UIColorFromHex(0x666666);
    label1.text = @"心电图";
    
    NSLog(@"self.image1.frame.origin.y = %f",self.image1.frame.origin.y);
    NSLog(@"label1.frame.origin.y = %f",label1.frame.origin.y);
    [self.view addSubview: label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(120, weakSelf.image2.frame.origin.y+ weakSelf.image2.frame.size.height+6, 100, 20)];
    label2.center = CGPointMake(self.image2.center.x, label1.center.y) ;
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = UIColorFromHex(0x666666);
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"心肺音频";
    [self.view addSubview: label2];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(120, weakSelf.image3.frame.origin.y+ weakSelf.image3.frame.size.height+6, 100, 20)];
    label3.center = CGPointMake(self.image3.center.x, label1.center.y) ;
    label3.font = [UIFont systemFontOfSize:14];
    label3.textColor = UIColorFromHex(0x666666);
    label3.textAlignment = NSTextAlignmentCenter;
    label3.text = @"图片";
    [self.view addSubview: label3];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(38, self.cornerHolder.frame.origin.y+self.cornerHolder.frame.size.height+134, self.view.frame.size.width - 38*2, 42)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 21;
    [btn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = UIColorFromHex(0x3cd793);
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    NSMutableArray *imageViewArr = [[NSMutableArray alloc]init];
    [imageViewArr addObject:_image1];
    [imageViewArr addObject:_image2];
    [imageViewArr addObject:_image3];
    
    for (int i=0; i<imageViewArr.count; i++) {
        UIImageView *view = imageViewArr[i];
        UIButton *button = [[UIButton alloc]initWithFrame:view.frame];
        [self.view addSubview:button];
        switch (i) {
            case 0:
                [button addTarget:self action:@selector(electrocardiogramBtn) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 1:
                [button addTarget:self action:@selector(heartLungBtn) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 2:
                [button addTarget:self action:@selector(imageBtn) forControlEvents:UIControlEventTouchUpInside];
                break;
                
            default:
                break;
        }
    }
}


- (void)electrocardiogramBtn {
    aaaViewController *aa = [[aaaViewController alloc]init];
    [self.navigationController pushViewController:aa animated:YES];
}

- (void)heartLungBtn {
    bbbViewController *bb = [[bbbViewController alloc]init];
    [self.navigationController pushViewController:bb animated:YES];
}

- (void)imageBtn {
    
}

-(void)testAction:(UIButton *)sender{
    POPViewController *pop = [POPViewController new];
    [pop presentedViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
