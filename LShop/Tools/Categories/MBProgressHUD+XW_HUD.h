//
//  MBProgressHUD+XW_HUD.h
//  LShop
//
//  Created by XXxxi on 2018/11/30.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (XW_HUD)

//获取当前控制器
+(UIViewController *)getCurrentUIVC ;

//显示菊花
+ (void)juhuaguai:(UIView *)view;

// 显示文字
+ (void)showTipMessageInWindow:(NSString*)message;

// 个性定制
+ (void)showPendulumWithMessage:(NSString *)message isWindow:(BOOL)iswindow;

// 显示文字在特定界面
+(void)showTipMessageInWindow:(NSString *)message byView:(UIView *)showView ;

// 显示动画页面在特定界面
+(void)showPendulumWithMessage:(NSString *)message byView:(UIView *)showView ;

// 显示一个菊花
+ (MBProgressHUD *)showJuHuaTitle:(NSString *)title isWindow:(BOOL)isWindow ;

// 显示菊花进度+文字
+ (MBProgressHUD *)showProgressTitle:(NSString *)title isWindow:(BOOL)isWindow;


// 隐藏HUD
+ (void)hideHUD;



@end

NS_ASSUME_NONNULL_END
