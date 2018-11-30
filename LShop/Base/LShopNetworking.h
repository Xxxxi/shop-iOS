//
//  LShopNetworking.h
//  LShop
//
//  Created by XXxxi on 2018/11/30.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ResponseSuccess)(id response);
typedef void(^ResponseFail)(NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface LShopNetworking : NSObject

//GET请求
+(void)GETRequest:(NSString *)URLStr
       parameters:(id)parameters
         progress:(void(^)(NSProgress *uploadProgress))uploadProgress
          success:(void(^)(NSURLSessionDataTask *task, id responserobject))success
          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure ;

//POST请求 文件上传
+(void)POSTRequest:(NSString *)URLStr parameters:(id)parameters
     bodyWithBlock:(void(^)(id<AFMultipartFormData> formData))bodyBlock
          progress:(void(^)(NSProgress *uploadProgress))uploadProgress
           success:(void(^)(NSURLSessionDataTask *task, id responserobject))success
           failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure ;

//POST请求
+(void)POSTRequest:(NSString *)URLStr parameters:(id)parameters
          progress:(void(^)(NSProgress *uploadProgress))upLoadProgress
           success:(void(^)(NSURLSessionDataTask *task, id responserobject))success
           failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure ;

//PUT请求
+(void)PUTBDRequest:(NSString *)URLStr
        headerField:(NSDictionary *)headerDic
         parameters:(id)parameters
            success:(void (^)(NSURLSessionDataTask *tasks, id responserobject))success
            failure:(void (^)(NSURLSessionDataTask *tasks, NSError *error))failure;


@end

NS_ASSUME_NONNULL_END
