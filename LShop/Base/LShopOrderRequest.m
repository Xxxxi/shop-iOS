//
//  LShopOrderRequest.m
//  LShop
//
//  Created by XXxxi on 2018/12/5.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import "LShopOrderRequest.h"

@implementation LShopOrderRequest

#pragma mark 创建订单
+(void)LShopCreateOrderByParamDict:(id)paramDict
                           success:(xxiResponseSuccess)success
                              fail:(xxiResponseFail)fail{
    NSString *URLStr = [NSString stringWithFormat:@"%@%@",HostURL,LShopCreateOrder];
    NSLog(@"创建订单链接:%@",URLStr);
    
    [LShopNetworking POSTRequest:URLStr parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responserobject) {
        success(responserobject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}

@end
