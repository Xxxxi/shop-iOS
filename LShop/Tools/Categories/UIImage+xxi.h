//
//  UIImage+xxi.h
//  LShop
//
//  Created by XXxxi on 2018/11/30.
//  Copyright © 2018年 Chomp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>

/*
 * 水印方向
 */

typedef enum {
    
    //左上
    ImageWaterDirectTopLeft=0,
    
    //右上
    ImageWaterDirectTopRight,
    
    //左下
    ImageWaterDirectBottomLeft,
    
    //右下
    ImageWaterDirectBottomRight,
    
    //正中
    ImageWaterDirectCenter
    
}ImageWaterDirect;

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (xxi)


/**
 *  加载一个指定名称的图片
 *
 *  @param fileName  图片的名字
 *
 *  @return 生成的 UIImage 对象。
 */
+ (UIImage *)imageWithFile:(NSString *)fileName;

/**
 *  加载一个高亮的图片
 *
 *  @param fileName  图片的名字
 *  @param highlight 是不是加载高亮状态的图片
 *
 *  @return 生成的 UIImage 对象。
 */
+ (UIImage *)imageWithFile:(NSString *)fileName highlight:(BOOL)highlight;

/**
 *  生成一张指定颜色的图片
 *
 *  @param color 图片颜色
 *  @param size  图片尺寸
 *
 *  @return 生成的 UIImage 对象。
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  给图片添加水印操作
 *
 *  @param text      文字
 *  @param direction 水印的位置（枚举）
 *  @param fontColor 字体颜色
 *  @param fontPoint point
 *  @param marginXY  间距
 *
 *  @return Image
 */
-(UIImage *)waterWithText:(NSString *)text direction:(ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontPoint:(CGFloat)fontPoint marginXY:(CGPoint)marginXY;

/**
 *
 *
 *  @param waterImage 添加水印的图片
 *  @param direction  水印的位置
 *  @param waterSize  水印的大小
 *  @param marginXY   间距
 *
 *  @return UIImage
 */
-(UIImage *)waterWithWaterImage:(UIImage *)waterImage direction:(ImageWaterDirect)direction waterSize:(CGSize)waterSize  marginXY:(CGPoint)marginXY;
/**
 *  对图片进行处理 获得一张带有高斯模糊效果的图片
 *
 *  @param image 要处理的图片
 *  @param blur  模糊数值(默认是10)
 *
 *  @return UIImage
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
/**
 *  CoreImage图片高斯模糊
 *
 *  @param image 图片
 *  @param blur  模糊数值(默认是10)
 *
 *  @return 重新绘制的新图片
 */

+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

/**
 * 加载Gif
 */
+(UIImage *)Xxi_animateGifWithData:(NSData *)data ;

+(UIImage *)Xxi_animateGifWithGifNamed:(NSString *)imgName ;

/**
 * 返回二维码图片
 */

+(UIImage *)productQRcodeImgeWithContent:(NSString *)content size:(CGSize)size ;


/**
 *  灰化图片
 */
+(UIImage *)changeGrayImage:(UIImage *)oldImage  ;


@end

NS_ASSUME_NONNULL_END
