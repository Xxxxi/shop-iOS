//
//  LShopGoodsRequest.h
//  LShop
//
//  Created by XXxxi on 2018/12/3.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import <Foundation/Foundation.h>

//商品请求类

NS_ASSUME_NONNULL_BEGIN

@interface LShopGoodsRequest : NSObject

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

#pragma  mark 获取商品列表
+(void)getProductsResponseSuccess:(xxiResponseSuccess)success
                     ResponseFail:(xxiResponseFail)fail;


@end

NS_ASSUME_NONNULL_END
