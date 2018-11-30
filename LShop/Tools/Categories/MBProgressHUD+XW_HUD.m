//
//  MBProgressHUD+XW_HUD.m
//  LShop
//
//  Created by XXxxi on 2018/11/30.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import "MBProgressHUD+XW_HUD.h"

@implementation MBProgressHUD (XW_HUD)

//获取当前控制器
+(UIViewController *)getCurrentUIVC{
    
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    
    UIViewController *parent = rootVC;
    
    while ((parent = rootVC.presentedViewController) != nil ) {
        rootVC = parent;
    }
    
    while ([rootVC isKindOfClass:[UINavigationController class]]) {
        rootVC = [(UINavigationController *)rootVC topViewController];
    }
    
    UIViewController  *superVC = rootVC;
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
    
}

//显示菊花
+(void)juhuaguai:(UIView *)view{
    //初始化进度框，置于当前的view之中
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:view];
    [view addSubview:hud];
    //显示对话框
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:3.0f];
}

// 显示文字
+(void)showTipMessageInWindow:(NSString *)message byView:(UIView *)showView{
    [MBProgressHUD hideHUD];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *view = showView;
        
        if(!view){
            view = (UIView *)[UIApplication sharedApplication].delegate.window;
        }
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.detailsLabel.text = message?message:@"加载中...";
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
        hud.removeFromSuperViewOnHide = YES;
        hud.mode = MBProgressHUDModeText;
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.backgroundView.color = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        hud.bezelView.backgroundColor = [UIColor whiteColor];
        hud.contentColor = [UIColor lightGrayColor];
        [hud hideAnimated:YES afterDelay:1.5f];
    });
}

//只显示文字
+(void)showTipMessageInWindow:(NSString *)message{
    [MBProgressHUD hideHUD];
    [self showTipMessage:message isWindow:true timer:1];
}

+(void)showTipMessage:(NSString *)message isWindow:(BOOL)isWindow timer:(int)aTimer{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
        hud.mode = MBProgressHUDModeText;
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.backgroundView.color = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
        hud.bezelView.backgroundColor =[UIColor whiteColor];
        hud.contentColor = [UIColor lightGrayColor];
        [hud hideAnimated:YES afterDelay:1.5f];
    });
}

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].navigationController.view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = message?message:@"加载中...";
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

//显示文字
+(void)showPendulumWithMessage:(NSString *)message byView:(UIView *)showView{
    MBProgressHUD *HUD = [self createMBProgressHUDviewWithMessage:message isWindiw:YES];
    HUD.mode = MBProgressHUDModeIndeterminate;
    [HUD hideAnimated:YES afterDelay:3.0f];
}


+(void)hideHUD{
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:winView animated:YES];
    [self hideHUDForView:[self getCurrentUIVC].view animated:YES];
    [self hideHUDForView:[self getCurrentUIVC].navigationController.view animated:YES];
}

//加载动画
+(void)showPendulumWithMessage:(NSString *)message isWindow:(BOOL)iswindow{
    [MBProgressHUD hideHUD];
    MBProgressHUD *HUD = [self createMBProgressHUDviewWithMessage:message isWindiw:iswindow];
    
    HUD.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    HUD.backgroundView.color = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    HUD.bezelView.backgroundColor = [UIColor whiteColor] ;
    HUD.contentColor = [UIColor lightGrayColor] ;
    
    UIImageView *backview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    backview.contentMode = UIViewContentModeScaleAspectFit ;
    
    NSMutableArray *imgArr = [NSMutableArray array] ;
    
    for (NSUInteger i = 1; i<=7; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_refresh_%zd", i]];
        [imgArr addObject:image];
    }
    
    
    backview.animationImages = imgArr ;
    backview.animationDuration = 1.5f ;
    [backview startAnimating];
    
    HUD.customView = backview ;
    HUD.mode = MBProgressHUDModeCustomView ;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [HUD hideAnimated:YES afterDelay:20.f];
    });
    
}

#pragma mark -- 加载动画
+(void)showLoadingWithMessage:(NSString *)message isWindow:(BOOL)isWindow{
    
    MBProgressHUD *HUD = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    
    UIImageView *backview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    backview.contentMode = UIViewContentModeScaleAspectFit ;
    
    UIImage *gifImg = [UIImage Xxi_animateGifWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"153714" ofType:@"gif"]]] ;
    
    backview.image = gifImg ;
    HUD.customView = backview ;
    HUD.mode = MBProgressHUDModeCustomView ;
    
}

//显示一个菊花
+(MBProgressHUD *)showJuHuaTitle:(NSString *)title isWindow:(BOOL)isWindow{
    [MBProgressHUD hideHUD];
    UIView *view = [self getCurrentUIVC].navigationController.view;
    
    if(isWindow || view){
        view = (UIView *)[UIApplication sharedApplication].delegate.window;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = title;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    hud.bezelView.backgroundColor = [UIColor whiteColor];
    hud.contentColor = [UIColor lightGrayColor];
    return  hud;
}

//显示菊花和文字
+(MBProgressHUD *)showProgressTitle:(NSString *)title isWindow:(BOOL)isWindow{
    [MBProgressHUD hideHUD];
    UIView *view = [self getCurrentUIVC].navigationController.view;
    
    if(isWindow || view){
        view = (UIView *)[UIApplication sharedApplication].delegate.window;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = title;
    
    return  hud;
}





@end
