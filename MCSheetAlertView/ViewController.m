//
//  ViewController.m
//  MCSheetAlertView
//
//  Created by 123 on 16/9/21.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "ViewController.h"
#import "MCActionSheetView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    MCActionSheetView *view = [[MCActionSheetView alloc] init];
    view.titleNames = @[@"删除",@"确定"];
    view.titleColors = @[[UIColor orangeColor],[UIColor blackColor]];
    view.firstButtonBlock = ^(){
        NSLog(@"第一个按钮的点击事件");
    };
    view.secondButtonBlock =^(){
        NSLog(@"第二个按钮的点击事件");
    };
    view.detailName = @"您确定删除此条数据么?";
    [view show];
}
@end
