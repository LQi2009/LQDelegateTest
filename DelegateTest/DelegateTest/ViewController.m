//
//  ViewController.m
//  DelegateTest
//
//  Created by Artron_LQQ on 16/7/6.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "LZAlertView.h"

@interface ViewController ()<LZAlertViewDataSource,LZAlertViewDelegate>

{
    LZAlertView *alert;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    alert = [[LZAlertView alloc]initWithFrame:self.view.bounds];
    alert.dataSource = self;
    alert.delegate = self;
//    [self.view addSubview:alert];
    
}
// 数据源方法
- (NSString *)messageForAlertView:(LZAlertView*) alertView {
    
    return @"测试数据";
}

//代理方法
- (void)alertView:(LZAlertView*)alertView didClickAtIndex:(NSInteger)index {
    
    NSLog(@"点击了:::%ld",(long)index);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [alert alertShowInView:self.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
