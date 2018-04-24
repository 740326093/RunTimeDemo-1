//
//  ViewController.m
//  RunTimeDemo-OC
//
//  Created by yunna on 2018/4/3.
//  Copyright © 2018年 yunna. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+JHExtension.h"
#import "UITapGestureRecognizer+JHExtension.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *FirstButton;
@property (weak, nonatomic) IBOutlet UIButton *SecondButton;
@property (weak, nonatomic) IBOutlet UIButton *ThirdButton;

@property (weak, nonatomic) IBOutlet UIButton *FourBtn;




@property (weak, nonatomic) IBOutlet UILabel *FirstLabel;
@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically
    self.FirstButton.durationTime = 1;
    self.SecondButton.durationTime = 2;
    
    [self.ThirdButton setEnlargeEdgeWithTop:20 right:20 bottom:30 left:30];
    
    self.FirstLabel.userInteractionEnabled = YES;
    self.SecondLabel.userInteractionEnabled = YES;
    
    self.FourBtn.ButtonParam = @{@"我是button的参数":@"我是button的参数"};
    
    [self.FourBtn addTarget:self action:@selector(FourBtnEcent:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOneEvent) withDuration:1];
    [self.FirstLabel addGestureRecognizer:tap1];
    
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTwoEvent)];
    tap2.duration = 2;
    [self.SecondLabel addGestureRecognizer:tap2];
    
    
    
    
 
}

- (IBAction)FirstButtonEvent:(id)sender {
    NSLog(@"点击第一个按钮:%@",[self CurrentStingTime]);
}

- (IBAction)SecondButtonEvent:(id)sender {
    NSLog(@"点击第二个按钮:%@",[self CurrentStingTime]);
}

- (IBAction)ThirdButtonEvent:(id)sender {
    NSLog(@"点击第三个按钮");
}
 
- (void)FourBtnEcent:(UIButton*)sender{
     NSLog(@"%@",sender.ButtonParam);
}


- (void)tapOneEvent{
    NSLog(@"点击第一个label:%@",[self CurrentStingTime]);
}
- (void)tapTwoEvent{
    NSLog(@"点击第二个label:%@",[self CurrentStingTime]);
}



- (IBAction)TEST:(id)sender {
    [self.navigationController pushViewController:[[UIViewController alloc]init] animated:YES];
}




///获取当前时间
- (NSString *)CurrentStingTime{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //“HH”代表24小时制，“hh”代表12小时制
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    return dateString;
}






@end
