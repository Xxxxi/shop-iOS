//
//  LShopGoodsReturnData.m
//  LShop
//
//  Created by XXxxi on 2018/12/5.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import "LShopGoodsReturnData.h"

@implementation LShopGoodsReturnData

#pragma mark 返回单一商品的详情数据
+(NSMutableArray<ProductModel *> *)returnProductDetailData:(id)responseObject {
    
    NSMutableArray *arrM  = [NSMutableArray arrayWithCapacity:0];
    if([responseObject isKindOfClass:[NSDictionary class]]){
        NSString *errorCode = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        if([errorCode isEqualToString:@"0"]){
            //增加其他数据
            ProductModel *model = [ProductModel modelWithJSON:responseObject[@"data"]];
            model.g_attrs = [NSMutableArray array];
            model.categroy_path = [NSMutableArray array];
            model.goods_skus = [NSMutableArray array];
            model.g_discount_items = [NSMutableArray array];
            
            //增加categroy_path数据
            id  categoryDict = responseObject[@"data"][@"categroy_path"];
            if([categoryDict isKindOfClass:[NSArray class]]){
                NSArray *categroy_pathArr = responseObject[@"data"][@"categroy_path"];
                if(categroy_pathArr.count != 0){
                    for (id dic in categroy_pathArr) {
                        CategoryPathModel *categoryPathModel = [CategoryPathModel modelWithJSON:dic];
                        [model.categroy_path addObject:categoryPathModel];
                    }
                }
            }
            
            //增加goods_skus数据
            id  goods_skusDict = responseObject[@"data"][@"goods_skus"];
            if([goods_skusDict isKindOfClass:[NSArray class]]){
                NSArray *goods_skushArr = responseObject[@"data"][@"goods_skus"];
                if(goods_skushArr.count != 0){
                    for (id dic in goods_skushArr) {
                        GoodsSkuModel *goodskuModel = [GoodsSkuModel modelWithJSON:dic];
                        [model.goods_skus addObject:goodskuModel];
                    }
                }
            }
            
            
            //增加g_attrs数据
            id g_attrsDict = responseObject[@"data"][@"g_attrs"];
            if([g_attrsDict isKindOfClass:[NSArray class]]){
                NSArray *g_attrsArr = responseObject[@"data"][@"g_attrs"];
                if(g_attrsArr.count != 0){
                    for (id dic in g_attrsArr) {
                        GAttrsModel *gattrModel = [GAttrsModel modelWithJSON:dic];
                        gattrModel.GArrM = [NSMutableArray array];
                        id valueDic = dic[@"values"];
                        if([valueDic isKindOfClass:[NSArray class]]){
                            NSArray *valuesArr = dic[@"values"];
                            if(valuesArr.count != 0){
                                for (id dict in valuesArr) {
                                    OPTModel *optModel = [OPTModel modelWithJSON:dict];
                                    [gattrModel.GArrM addObject:optModel];
                                }
                                [model.g_attrs addObject:gattrModel];
                            }
                        }
                    }
                }
            }
            [arrM addObject:model];
        }else{
            NSLog(@"请求报错信息");
        }
    }else{
        NSLog(@"容错:错误的解析类型");
    }
    return  arrM;
}

#pragma mark 返回商品列表
+(NSMutableArray<ProductModel *> *)returnProductList:(id)responseObject{
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:0];
    if([responseObject isKindOfClass:[NSDictionary class]]){
        NSString *errorCode = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        if([errorCode isEqualToString:@"0"]){
            id dic = responseObject[@"data"][@"items"];
            if([dic isKindOfClass:[NSArray class]]){
                NSArray *itemsArr = (NSArray *)dic;
                if(itemsArr.count != 0){
                    for (id dict in itemsArr) {
                        ProductModel *model = [ProductModel modelWithJSON:dict];
                        model.g_attrs = [NSMutableArray array];
                        model.categroy_path = [NSMutableArray array];
                        model.goods_skus = [NSMutableArray array];
                        model.g_discount_items = [NSMutableArray array];
                        
                        //增加categroy_path数据
                        id  categoryDict = dict[@"categroy_path"];
                        if([categoryDict isKindOfClass:[NSArray class]]){
                            NSArray *categroy_pathArr = (NSArray *)categoryDict;
                            if(categroy_pathArr.count != 0){
                                for (id dic in categroy_pathArr) {
                                    CategoryPathModel *categoryPathModel = [CategoryPathModel modelWithJSON:dic];
                                    [model.categroy_path addObject:categoryPathModel];
                                }
                            }
                        }
                        
                        //增加goods_skus数据
                        id  goods_skusDict = dict[@"goods_skus"];
                        if([goods_skusDict isKindOfClass:[NSArray class]]){
                            NSArray *goods_skushArr = (NSArray *)goods_skusDict;
                            if(goods_skushArr.count != 0){
                                for (id dic in goods_skushArr) {
                                    GoodsSkuModel *goodskuModel = [GoodsSkuModel modelWithJSON:dic];
                                    [model.goods_skus addObject:goodskuModel];
                                }
                            }
                        }
                        
                        
                        //增加g_attrs数据
                        id g_attrsDict = dict[@"g_attrs"];
                        if([g_attrsDict isKindOfClass:[NSArray class]]){
                            NSArray *g_attrsArr = (NSArray *)g_attrsDict;
                            if(g_attrsArr.count != 0){
                                for (id dic in g_attrsArr) {
                                    GAttrsModel *gattrModel = [GAttrsModel modelWithJSON:dic];
                                    gattrModel.GArrM = [NSMutableArray array];
                                    id valueDic = dic[@"values"];
                                    if([valueDic isKindOfClass:[NSArray class]]){
                                        NSArray *valuesArr = dic[@"values"];
                                        if(valuesArr.count != 0){
                                            for (id dict in valuesArr) {
                                                OPTModel *optModel = [OPTModel modelWithJSON:dict];
                                                [gattrModel.GArrM addObject:optModel];
                                            }
                                            [model.g_attrs addObject:gattrModel];
                                        }
                                    }
                                }
                            }
                        }
                        [arrM addObject:model];
                    }
                }else{
                    //没有数据，加载时候调用
                }
            }
        }else{
            NSLog(@"弹窗显示具体的错误");
        }
    }else{
        NSLog(@"容错：错误的解析类型");
    }

    return  arrM;
}


@end

