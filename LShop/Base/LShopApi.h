//
//  LShopApi.h
//  LShop
//
//  Created by XXxxi on 2018/11/30.
//  Copyright © 2018年 Chomp. All rights reserved.
//

//api接口
#ifndef LShopApi_h
#define LShopApi_h

// 服务器
#define HostURL @"http://47.106.36.175:8099"

/* 查询商品接口
 * 传入参数：g_cls_id:商品分类id   page:页码  per-page:每一页数量   查询某一个特定商品直接在最后拼接上id,格式为/id
 */
#define LShopGoods @"/lgoods"

/* 创建订单接口
 * 传入参数：og_sku_id:商品sku的id   og_total_num:购买的数量  discount_params:用户折扣选择
 */
#define LShopCreateOrder  @"/lorder"


#endif /* LShopApi_h */
