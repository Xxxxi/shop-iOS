//
//  ProductModel.h
//  LShop
//
//  Created by XXxxi on 2018/12/3.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductModel : NSObject
@property(nonatomic,copy)NSString *g_id;  /**商品id*/
@property(nonatomic,copy)NSString *g_name;/**商品名称*/
@property(nonatomic,copy)NSString *g_sid;
@property(nonatomic,copy)NSString *g_stype;
@property(nonatomic,copy)NSString *g_cls_id;
@property(nonatomic,copy)NSString *g_created_at,*g_updated_at;
@property(nonatomic,copy)NSString *g_m_img_id,*g_m_img_id1,*g_m_img_id2,*g_m_img_id3,*g_m_img_id4;
@property(nonatomic,strong)NSMutableArray *g_attrs;
@property(nonatomic,strong)NSMutableArray *categroy_path; //CategoryPathModel
@property(nonatomic,strong)NSMutableArray *goods_skus;  //GoodsSkuModel(商品SKU条目列表)
@property(nonatomic,copy)NSString *g_m_img_url,*g_m_img_url1,*g_m_img_url2,*g_m_img_url3;
@property(nonatomic,copy)NSString *g_price; /**商品价格*/
@property(nonatomic,copy)NSString *g_discount;/**商品折扣*/
@property(nonatomic,strong)NSMutableArray *g_discount_items;  
@end

@interface GoodsSkuModel:NSObject
@property(nonatomic,copy)NSString *sku_id; /**sku的id*/
@property(nonatomic,copy)NSString *sku_g_id;
@property(nonatomic,copy)NSString *sku_index; /**sku索引名称*/
@property(nonatomic,copy)NSString *sku_index_status; /**索引的名称的状态*/
@property(nonatomic,copy)NSString *sku_is_master; /**是否是主要sku*/
@property(nonatomic,copy)NSString *sku_name; /**ku的名称*/
@property(nonatomic,copy)NSString *sku_price; /**sku条目的价格*/
@property(nonatomic,copy)NSString *sku_created_at,*sku_updated_at;
@end

@interface GAttrsModel:NSObject
@property(nonatomic,copy)NSString *a_name;
@property(nonatomic,copy)NSString *a_id;
@property(nonatomic,strong)NSMutableArray *GArrM;  //OPTModel
@end

@interface OPTModel:NSObject
@property(nonatomic,copy)NSString *opt_id;
@property(nonatomic,copy)NSString *opt_name;
@property(nonatomic,copy)NSString *opt_value;
@end

@interface CategoryPathModel:NSObject
@property(nonatomic,copy)NSString *g_cls_id;  /**分类id*/
@property(nonatomic,copy)NSString *g_cls_show_name; /**分类名称*/
@property(nonatomic,copy)NSString *g_cls_pid;/**分类父级id*/
@end

NS_ASSUME_NONNULL_END
