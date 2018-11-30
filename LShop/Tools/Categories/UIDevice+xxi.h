//
//  UIDevice+xxi.h
//  LShop
//
//  Created by XXxxi on 2018/11/30.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (xxi)

/**
 *  返回设备的平台信息
 *  如：“iPhone3,2"
 *
 *  @return 描述设备平台信息的字符串
 */
+ (NSString *)platform;

/**
 *  返回用户定义的设备平台信息。
 *  如：“iPad Air (Cellular)"
 *
 *  @return 自定义的设备平台信息字符串
 */
+ (NSString *)platformString;

/**
 *  返回 IOS 的版本信息。
 *
 *  @return 表示 IOS 版本信息的整型数
 */
+ (NSInteger)iOSVersion;

/**
 *  返回当前设备的 MAC 地址。
 *
 *  @return 表示当前设备 MAC 地址的字符串
 */
+ (NSString *)macAddress;

/**
 *  返回表示当前设备的唯一值。
 *
 *  @return 表示当前设备唯一值的字符串。
 */
+ (NSString *)uniqueIdentifier;

/**
 *  返回当前设备的IP地址
 *
 *  @return 表示当前设备Ip地址的唯一的字符串
 */

+ (NSString *)IpAddress ;

//获取外网ip
+(NSDictionary *)deviceWANIPAdress ;

@end

NS_ASSUME_NONNULL_END
