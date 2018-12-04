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
    [self productList];
    // Do any additional setup after loading the view, typically from a nib.
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
    
    [LShopGoodsRequest getProductsResponseSuccess:^(id  _Nonnull responseObject) {
        NSLog(@"商品列表%@",responseObject);
        NSString *errorCode = [NSString stringWithFormat:@"%@",responseObject[@"code"]];
        if([errorCode isEqualToString:@"0"]){
            for (id dict in responseObject[@"data"]) {
                //增加其他数据
                ProductModel *model = [ProductModel modelWithJSON:dict];
                model.g_attrs = [NSMutableArray array];
                model.categroy_path = [NSMutableArray array];
                model.goods_skus = [NSMutableArray array];
                model.g_discount_items = [NSMutableArray array];
                
                //增加categroy_path数据
                
                if(dict[@"categroy_path"]){
                    NSArray *categroy_pathArr = dict[@"categroy_path"];
                    if(categroy_pathArr.count != 0){
                        for (id dic in categroy_pathArr) {
                            CategoryPathModel *categoryPathModel = [CategoryPathModel modelWithJSON:dic];
                            [model.categroy_path addObject:categoryPathModel];
                        }
                    }
                }
                
                //增加goods_skus数据
                if(dict[@"goods_skus"]){
                    NSArray *goods_skushArr = dict[@"goods_skus"];
                    if(goods_skushArr.count != 0){
                        for (id dic in goods_skushArr) {
                            GoodsSkuModel *goodskuModel = [GoodsSkuModel modelWithJSON:dic];
                            [model.goods_skus addObject:goodskuModel];
                        }
                    }
                }
                
                //增加g_attrs数据
                if(dict[@"g_attrs"]){
                    NSArray *g_attrsArr = dict[@"g_attrs"];
                    if(g_attrsArr.count != 0){
                        for (id dic in g_attrsArr) {
                            GAttrsModel *gattrModel = [GAttrsModel modelWithJSON:dic];
                            gattrModel.GArrM = [NSMutableArray array];
                            if(dic[@"values"]){
                                NSArray *valuesArr = dic[@"values"];
                                if(valuesArr.count != 0){
                                    for (id dict in valuesArr) {
                                        OPTModel *optModel = [OPTModel modelWithJSON:dict];
                                        [gattrModel.GArrM addObject:optModel];
                                        [model.g_attrs addObject:gattrModel];
                                    }
                                }
                            }
                        }
                    }
                    
                }
                
                [self.data_arr addObject:model];
                NSLog(@"self.data_arr---%@",self.data_arr);
            }
            
            
        }
        
    } ResponseFail:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"异常，相对应的处理");
    }];
}

#pragma mark 单一商品详情
-(void)productDetail{
    
}

@end
