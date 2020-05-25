//
//  Tool.h
//  exhibition
//
//  Created by 古军 on 2020/5/25.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject

///颜色转图片
+ (UIImage *)createImageWithColor:(UIColor*) color;
///获取字符串的宽高
+ (CGSize)boundingRectWithString:(NSString *)string withSize:(CGSize)size anfont:(CGFloat)fontSize;
//根据高度获取字符串的宽度
+ (CGFloat)calculateRowWidth:(NSString *)string withFont:(CGFloat)fontSize withHeight:(CGFloat)height;
//根据宽度获取字符串的高度
+ (CGFloat)calculateRowHeight:(NSString *)string withFont:(CGFloat)fontSize withWidth:(CGFloat)width;
///字典转json
+ (NSString*)convertToJSONData:(id)infoDict;
+ (NSString*)WL_ConvertToJSONData:(id)infoDict;
///检测用户是否打开定位
+ (void)checkOpenGPS:(UIViewController *)viewCtrl;
///日历日期转换
+ (NSString *)dateFormatter:(NSString *)strTime;
+ (NSString *)dateFormatterWitheDate:(NSDate *)date;
+ (NSString *)getWeekDay:(NSDate *)date;
///日期转换  format --- > @"yyyy-MM-dd HH:mm"
+ (NSString *)date:(NSDate *)date andFormatter:(NSString *)format;
//时间转时间戳
+(NSString *)getTimeStrWithString:(NSString *)str;
+(BOOL) isShowMsgTime:(NSString *) beginTime endTime:(NSString *) endTime;

+ (NSString *)osVsersion;
///获取本地文件创建时间
+ (NSString *)getFileCreateTimeWithFileName:(NSString *)fileName;
///获取当前view的控制器
+ (UIViewController*)viewController:(UIView *)view;
//时间戳之差
+ (NSString*)compareTwoTime:(long long)time1 time2:(long long)time2;

///保存通讯录提醒谁看选择记录
+ (void)setHistoryRemind:(NSDictionary *)dict;

///判断字符串是否全是大写
+ (BOOL)checkStringIsCapitals:(NSString *)str;
///检测文件名是否合法
+ (BOOL)checkFileNameWithName:(NSString *)fileName;

///得到文件后缀名（用来获取文件类型）
+ (NSString *)getFileSuffixWithFileName:(NSString *)fileName;
///获取文件大小
+ (long long)getFileSize:(NSString *)fileName;
///电话号码验证
+ (BOOL)validateContactNumber:(NSString *)mobileNum;
///生成二维码
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize;

///字符串格式化null自动转为@""
+ (NSString *)judgeStr:(id)str;

//判断字符串是否是null
+ (BOOL)isNullString:(NSString *)string;
//判断是否含有非法字符
+ (BOOL)jxb_InvalidCharacter:(NSString *)content;
+(BOOL)jxb_HaveEmpty:(NSString *) str;
//-----过滤字符串中的emoji
+ (NSString *)disable_emoji:(NSString *)text;
//-----限制字符串中的emoji
+ (BOOL)hasEmoji:(NSString*)string;

+(BOOL)isNineKeyBoard:(NSString *)string;
//字典转字符串
+(NSString*)dictionaryToJson:(NSDictionary *)dic;
//json字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
//json字符串转数组
+ (NSArray *)stringToJSON:(NSString *)jsonStr;
+ (NSString *)time_timestampToString:(NSInteger)timestamp;
//时间判断
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
+ (BOOL)stringContainsEmoji:(NSString *)string;//限制表情输入
+ (BOOL)emojiInSoftBankUnicode:(short)code;//限制表情输入
+ (BOOL)emojiInUnicode:(short)code;//限制表情输入
+ (BOOL) IsPhoneNumber:(NSString *)number;
+ (NSString *)getNowTimeTimestamp3;
+(NSString *)getNowTimeTimestampNow;
+(NSArray *)sortedArrayUsingComparatorByPaymentTimeWithDataArr:(NSArray *)dataArr;

@end

NS_ASSUME_NONNULL_END
