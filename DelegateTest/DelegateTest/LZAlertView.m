//
//  LZAlertView.m
//  DelegateTest
//
//  Created by Artron_LQQ on 16/7/6.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZAlertView.h"

@interface LZAlertView ()

@property (strong, nonatomic) UILabel *messageLabel;
@end

@implementation LZAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    
    return self;
}
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self setUI];
    }
    
    return self;
}

- (void)setUI {
    
    UIView *bgView = [[UIView alloc]init];
    bgView.center = self.center;
    bgView.backgroundColor = [UIColor greenColor];
    bgView.bounds = CGRectMake(0, 0, 200, 150);
    [self addSubview:bgView];
    
    
    //    添加顶部文本框
    UILabel *topLabel = [[UILabel alloc]init];
    
    topLabel.text = @"测试alert";
    topLabel.frame = CGRectMake(0, 0, bgView.frame.size.width, 30);
    topLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:topLabel];
    
    // 添加消息框
    UILabel *messageLable = [[UILabel alloc]init];
    
//    messageLable.text = aMsg;
    messageLable.frame = CGRectMake(0, 40, bgView.frame.size.width, 40);
    messageLable.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:messageLable];
    _messageLabel = messageLable;
    
    //    添加确定、取消按钮
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeSystem];
    okButton.tag = 1;
    okButton.backgroundColor = [UIColor yellowColor];
    [okButton setTitle:@"确定" forState:UIControlStateNormal];
    okButton.frame = CGRectMake(10, 90, 80, 50);
    [okButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:okButton];
    
    UIButton *cencleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cencleButton.tag = 0;
    cencleButton.backgroundColor = [UIColor yellowColor];
    [cencleButton setTitle:@"取消" forState:UIControlStateNormal];
    cencleButton.frame = CGRectMake(110, 90, 80, 50);
    [cencleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:cencleButton];

}

- (void)buttonClick:(UIButton*)button {
    //调用delegate
    if (self.delegate && [self.delegate respondsToSelector:@selector(alertView:didClickAtIndex:)]) {
        [self.delegate alertView:self didClickAtIndex:button.tag];
    }
    
    [self removeFromSuperview];
}

- (void)alertShowInView:(UIView*)superView {
    
    [superView addSubview:self];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    //调用dataSource
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(messageForAlertView:)]) {
        
        self.messageLabel.text = [self.dataSource messageForAlertView:self];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
