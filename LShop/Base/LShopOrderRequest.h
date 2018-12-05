//
//  LShopOrderRequest.h
//  LShop
//
//  Created by XXxxi on 2018/12/5.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  宏定义请求成功的block
 *
 *  @param responseObject 请求成功返回的数据
 */
typedef void(^xxiResponseSuccess)(id responseObject);

/**
 *  宏定义请求失败的block
 *
 *  @param error 报错信息
 */
typedef void(^xxiResponseFail)(NSURLSessionDataTask *task, NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface LShopOrderRequest : NSObject

#pragma mark 创建订单
+(void)LShopCreateOrderByParamDict:(id)paramDict
                           success:(xxiResponseSuccess)success
                              fail:(xxiResponseFail)fail;

@end

NS_ASSUME_NONNULL_END
