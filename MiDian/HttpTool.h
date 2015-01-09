//
//  HttpTool.h
//  MiDian
//
//  Created by Miracolo Bosco on 15/1/8.
//  Copyright (c) 2015年 MI-31. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject
/**
 *  HttpTool 单例
 *
 *  @return <#return value description#>
 */
+ (instancetype)shareInstance;

/**
 *  url发送请求
 *
 *  @param url        请求的url
 *  @param parameters 请求所需参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)requestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^) (id json))success failure:(void (^) (NSError *error))failure;
@property (nonatomic, strong, readonly)NSArray *myarray;
@end
