//
//  MCActionSheetView.m
//  myApp
//
//  Created by 123 on 16/9/9.
//  Copyright © 2016年 careerman. All rights reserved.
//

#import "MCActionSheetView.h"
#import "Masonry.h"
#define kAlertViewMargin 44
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kColorWithRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

@interface MCActionSheetView ()
@property(nonatomic,strong)UIView * subView;
@end

@implementation MCActionSheetView

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self setupUI];
}
-(void)setupUI{
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:tap];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    _subView = [[UIView alloc] init];
    _subView.backgroundColor  = [UIColor lightGrayColor];
    [self addSubview:_subView];
    /// 最底部的取消按钮
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [cancleButton setBackgroundColor:[UIColor whiteColor]];
    [_subView addSubview:cancleButton];
    [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_subView);
        make.height.equalTo(@(kAlertViewMargin));
        make.left.right.equalTo(_subView);
    }];
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.numberOfLines = 0;
    [_subView addSubview:detailLabel];
//    detailLabel.text = @"这是一个测试的数据这是一个测试的数据这是一个测试的数据这是一个测试的数据这是一个测试的数据";
    detailLabel.text = self.detailName;
    detailLabel.textColor = [UIColor grayColor];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    NSInteger i = self.titleNames.count +1;
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_subView).offset(-(40 + i*kAlertViewMargin));
        //        make.bottom.equalTo(_subView).offset(-200);
        make.left.equalTo(_subView).offset(15);
        make.right.equalTo(_subView).offset(-15);
//        make.height.equalTo(@(40));
    }];
    
    for (NSInteger i = 0; i < self.titleNames.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:self.titleNames[i] forState:UIControlStateNormal];
        [_subView addSubview:button];
        [button setBackgroundColor:[UIColor whiteColor]];
        button.tag = 2010 +i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:self.titleColors[i] forState:UIControlStateNormal];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(cancleButton.mas_top).offset(-(20 + i*kAlertViewMargin));
            make.left.right.equalTo(_subView);
            make.height.equalTo(@(kAlertViewMargin));
        }];
        UIView *lineView = [[UIView alloc] init];
        [_subView addSubview:lineView];
        lineView.backgroundColor = kColorWithRGB(0xf0f0f0);
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(button.mas_bottom);
            make.left.right.equalTo(_subView);
            make.height.equalTo(@(1));
        }];
    }
    

    if (self.detailName) {
        
        [_subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.right.equalTo(self);
            //        make.height.equalTo(@(kAlertViewMargin*(self.titleNames.count +1)+220));
            make.top.equalTo(detailLabel).offset(-20);
        }];
    }else{
        [_subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.right.equalTo(self);
            make.height.equalTo(@(kAlertViewMargin*(self.titleNames.count +1)+20));
//            make.top.equalTo(detailLabel).offset(-20);
        }];
    }
    
}



-(void)dismiss{
    [self removeFromSuperview];
}

-(void)buttonClick:(UIButton *)sender{
    [self dismiss];
    if (sender.tag == 2010) {
        if (self.firstButtonBlock) {
            self.firstButtonBlock();
        }
    }else if(sender.tag == 2011){
        if (self.secondButtonBlock) {
            self.secondButtonBlock();
        }
    
    }
}

@end
