//
//  LShopGoodsReturnData.h
//  LShop
//
//  Created by XXxxi on 2018/12/5.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LShopGoodsReturnData : NSObject

//返回单一商品的详情数据
+(NSMutableArray<ProductModel *> *)returnProductDetailData:(id)responseObject;

//返回商品列表
+(NSMutableArray<ProductModel *> *)returnProductList:(id)responseObject;


@end

NS_ASSUME_NONNULL_END
