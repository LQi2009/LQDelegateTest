//
//  LZAlertView.h
//  DelegateTest
//
//  Created by Artron_LQQ on 16/7/6.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZAlertView;

// 声明代理方法
@protocol LZAlertViewDelegate <NSObject>

//@required //使用该关键字修饰的方法,必须实现
//@optional //使用该关键字修饰的方法,可选择性实现
- (void)alertView:(LZAlertView*)alertView didClickAtIndex:(NSInteger)index;

//这个方法可不实现
@optional
- (void)alertView:(LZAlertView *)alertView;
@end

// 声明数据源协议
@protocol LZAlertViewDataSource <NSObject>

//@required //使用该关键字修饰的方法,必须实现
//@optional //使用该关键字修饰的方法,可选择性实现
- (NSString *)messageForAlertView:(LZAlertView*) alertView;
@end

@interface LZAlertView : UIView
// 设置代理及数据源属性
@property (weak, nonatomic)id <LZAlertViewDelegate> delegate;
@property (weak, nonatomic)id <LZAlertViewDataSource>dataSource;

- (void)alertShowInView:(UIView*)superView;
@end
