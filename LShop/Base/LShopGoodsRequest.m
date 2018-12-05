//
//  LShopGoodsRequest.m
//  LShop
//
//  Created by XXxxi on 2018/12/3.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import "LShopGoodsRequest.h"

@implementation LShopGoodsRequest

#pragma mark  获取商品列表(可通过筛选条件和页码)
+(void)getProductsByParams:(NSDictionary *)dic
           ResponseSuccess:(xxiResponseSuccess)success
              ResponseFail:(xxiResponseFail)fail{
    NSString *URLStr = [NSString stringWithFormat:@"%@%@",HostURL,LShopGoods];
    NSLog(@"获取商品列表链接:%@",URLStr);
    [LShopNetworking GETRequest:URLStr parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responserobject) {
        success(responserobject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}

#pragma mark 获取单一商品详情
+(void)getSingleProductDetailByProductID:(NSString *)productId
                         ResponseSuccess:(xxiResponseSuccess)success
                            ResponseFail:(xxiResponseFail)fail{
    NSString *URLStr = [NSString stringWithFormat:@"%@%@/%@",HostURL,LShopGoods,productId];
    NSLog(@"获取单一商品详情链接");
    [LShopNetworking GETRequest:URLStr parameters:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responserobject) {
        success(responserobject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        fail(task,error);
    }];

}


@end
