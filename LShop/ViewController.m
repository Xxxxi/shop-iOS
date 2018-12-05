//
//  ViewController.m
//  LShop
//
//  Created by XXxxi on 2018/11/30.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import "ViewController.h"
#import "ProductModel.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *data_arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self productList];
//    [self productDetail];
    [self createOrder];
}

-(NSMutableArray *)data_arr{
    if(!_data_arr){
        if(!_data_arr){
            _data_arr = [NSMutableArray arrayWithCapacity:0];
        }
    }
    return  _data_arr;
}


#pragma mark 商品列表
-(void)productList{
    
    NSMutableDictionary *dict  = [NSMutableDictionary dictionary];
    [dict setObject:@"5" forKey:@"per-page"];
    [dict setObject:@"1" forKey:@"page"];
//    [dict setObject:@"32" forKey:@"g_cls_id"];
    [LShopGoodsRequest getProductsByParams:dict ResponseSuccess:^(id  _Nonnull responseObject) {
        self.data_arr = [[NSMutableArray alloc]initWithArray:[LShopGoodsReturnData returnProductList:responseObject]];
        NSLog(@"商品列表--%@",self.data_arr);
    } ResponseFail:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"异常，相对应的处理");
    }];
}

#pragma mark 单一商品详情
-(void)productDetail{
    [LShopGoodsRequest getSingleProductDetailByProductID:@"1" ResponseSuccess:^(id  _Nonnull responseObject) {
        self.data_arr = [[NSMutableArray alloc]initWithArray:[LShopGoodsReturnData returnProductDetailData:responseObject]];
        NSLog(@"单一商品详情--%@",self.data_arr);
    } ResponseFail:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"异常，做相对应的处理");
    }];
}

#pragma mark 创建订单
-(void)createOrder{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@"1" forKey:@"og_sku_id"];
    [param setObject:@"100" forKey:@"og_total_num"];
    [param setObject:@"" forKey:@"discount_params"];
    
    [LShopOrderRequest LShopCreateOrderByParamDict:param success:^(id responseObject) {
        NSLog(@"创建订单成功%@",responseObject);
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"创建订单失败%@",error);
    }];
}

@end
