//
//  LShopNetworking.m
//  LShop
//
//  Created by XXxxi on 2018/11/30.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import "LShopNetworking.h"



@implementation LShopNetworking

static AFHTTPSessionManager *manager;

//单例
+(AFHTTPSessionManager *)sharedHTTPSession{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}

//GET请求
+(void)GETRequest:(NSString *)URLStr
       parameters:(id)parameters
         progress:(void(^)(NSProgress *uploadProgress))uploadProgress
          success:(void(^)(NSURLSessionDataTask *task, id responserobject))success
          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)       {
        
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            [MBProgressHUD showTipMessageInWindow:@"当前网络不能上网!"];
        }
        //有网络再进行网络请求
        else
        {
            NSLog(@"get");
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES ;
            
            manager = [self sharedHTTPSession] ;
            // 设置超时时间
            [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
            manager.requestSerializer.timeoutInterval = 8.f;
            [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
            manager.requestSerializer =[AFJSONRequestSerializer serializer] ;
            manager.responseSerializer = [AFJSONResponseSerializer serializer] ;
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
            
            [manager GET:URLStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                //GET请求的下载进度操作在这里完成
                uploadProgress(downloadProgress);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO ;
                success(task,responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
                // 数据请求失败
                failure(task,error);
            }];
        }
    }];

}

//POST请求 文件上传
+(void)POSTRequest:(NSString *)URLStr
        parameters:(id)parameters
     bodyWithBlock:(void(^)(id<AFMultipartFormData> formData))bodyBlock
          progress:(void(^)(NSProgress *uploadProgress))uploadProgress
           success:(void(^)(NSURLSessionDataTask *task, id responserobject))success
           failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            //没网络
            [MBProgressHUD showTipMessageInWindow:@"当前网络不能上网!"];
        }
        //有网络
        else
        {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES ;
            
            manager = [self sharedHTTPSession] ;
            // 设置超时时间
            [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
            manager.requestSerializer.timeoutInterval = 8.f;
            [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
            manager.requestSerializer =[AFJSONRequestSerializer serializer] ;
            manager.responseSerializer = [AFJSONResponseSerializer serializer] ;
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
            
            [manager POST:URLStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                //上传的参数体
                bodyBlock(formData);
                
            } progress:^(NSProgress * _Nonnull downloadProgress) {
                
                //数据上传进度  warning:Implicit declaration of function 'upLoadProgress' is invalid in C99
                uploadProgress(downloadProgress);
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                //数据请求成功
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO ;
                //数据请求成功的回调
                success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [MBProgressHUD showTipMessageInWindow:@"网络异常,操作失败!"];
                //数据请求失败
                failure(task,error);
            }];
        }
    }];
}

//POST请求
+(void)POSTRequest:(NSString *)URLStr
        parameters:(id)parameters
          progress:(void(^)(NSProgress *uploadProgress))upLoadProgress
           success:(void(^)(NSURLSessionDataTask *task, id responserobject))success
           failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            //没网络
            [MBProgressHUD showTipMessageInWindow:@"当前网络不能上网!"];
        }
        //有网络
        else
        {
            if (status == AFNetworkReachabilityStatusReachableViaWiFi){
                NSLog(@"切换了网络");
            }
            //清除网络的缓存数据
            [[NSURLCache sharedURLCache] removeAllCachedResponses];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES ;
            
            NSLog(@"post");
            // 设置超时时间
            manager = [self sharedHTTPSession] ;
            [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
            [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
            manager.requestSerializer.timeoutInterval = 8.f;
            manager.requestSerializer =[AFJSONRequestSerializer serializer] ;
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
            //加密
//            NSString *paramStr = [NSString dictionaryToJson:parameters] ;
//            NSDictionary *postParams = @{@"msg":[SecurityUtil encryptAESData:paramStr]} ;
            NSLog(@"当前请求的接口-- %@\n封装的上传参数 --- %@\n",URLStr,parameters) ;
            
            [manager POST:URLStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                upLoadProgress(uploadProgress);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //数据请求成功
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO ;
                //数据请求成功的回调
                success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //数据请求失败
                NSInteger errorCode = error.code ;
                if (errorCode == -1001) {
                    [MBProgressHUD showTipMessageInWindow:@"请求超时,请稍后重试!"];
                }else if (errorCode == 404){
                    [MBProgressHUD showTipMessageInWindow:@"请求资源不存在,code = 404!"];
                }else{
                    [MBProgressHUD showTipMessageInWindow:@"网络异常,请稍后重试!"];
                }
                failure(task,error);
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO ;
                
            }];
        }
    }];
}

//PUT请求
+(void)PUTBDRequest:(NSString *)URLStr
        headerField:(NSDictionary *)headerDic
         parameters:(id)parameters
            success:(void (^)(NSURLSessionDataTask *tasks, id responserobject))success
            failure:(void (^)(NSURLSessionDataTask *tasks, NSError *error))failure
{
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            //没网络
            [MBProgressHUD showTipMessageInWindow:@"当前网络不能上网!"];
        }
        //有网络
        else
        {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES ;
            
            manager = [self sharedHTTPSession] ;
            // 设置超时时间
            [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
            manager.requestSerializer.timeoutInterval = 8.f;
            [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
            manager.requestSerializer =[AFJSONRequestSerializer serializer] ;
            manager.responseSerializer = [AFJSONResponseSerializer serializer] ;
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
            
            if (headerDic) {
                for (NSString *str in headerDic.allKeys) {
                    [manager.requestSerializer setValue:headerDic[str] forHTTPHeaderField:str];
                    NSLog(@"\n%@:%@\n",str,headerDic[str]);
                }
            }
            [manager PUT:URLStr parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //数据请求成功
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO ;
                //数据请求成功的回调
                success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [MBProgressHUD showTipMessageInWindow:@"网络异常,操作失败!"];
                //数据请求失败
                failure(task,error);
            }];
            
        }
    }];
}

@end
