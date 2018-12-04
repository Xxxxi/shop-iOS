//
//  LShopGoodsRequest.m
//  LShop
//
//  Created by XXxxi on 2018/12/3.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import "LShopGoodsRequest.h"

@implementation LShopGoodsRequest

#pragma mark  获取商品列表
+(void)getProductsResponseSuccess:(xxiResponseSuccess)success
                     ResponseFail:(xxiResponseFail)fail{
    NSString *URLStr = [NSString stringWithFormat:@"%@%@/1",HostURL,LShopGoods];
    [LShopNetworking GETRequest:URLStr parameters:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responserobject) {
        success(responserobject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}


@end
