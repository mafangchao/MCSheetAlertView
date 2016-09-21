//
//  MCActionSheetView.h
//  myApp
//
//  Created by 123 on 16/9/9.
//  Copyright © 2016年 careerman. All rights reserved.
//

/*
    使用方法:
         MCActionSheetView *view = [[MCActionSheetView alloc] init];
         view.titleNames = @[@"删除",@"确定"];
         view.titleColors = @[[UIColor orangeColor],[UIColor blackColor]];
         view.firstButtonBlock = ^(){
         DLOG(@"第一个按钮的点击事件");
         };
         view.secondButtonBlock =^(){
         DLOG(@"第二个按钮的点击事件");
         };
         view.detailName = @"您确定删除此条数据么?";
         [view show];
 
 */

#import <UIKit/UIKit.h>

@interface MCActionSheetView : UIView
/// 名字的数组
@property(nonatomic,copy)NSArray *titleNames;
/// 详情
@property(nonatomic,copy)NSString *detailName;
/// 文字颜色数组
@property(nonatomic,copy)NSArray *titleColors;

/// 取消按钮
@property(nonatomic,strong)UIButton *cancleButton;

/**
 *  第一个按钮的回调
 */
@property(nonatomic,copy)void(^firstButtonBlock)();
/**
 *  第二个按钮的回调
 */
@property(nonatomic,copy)void(^secondButtonBlock)();


/// 显示
-(void)show;
/// 消失
-(void)dismiss;

@end
