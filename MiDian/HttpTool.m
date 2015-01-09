//
//  HttpTool.m
//  MiDian
//
//  Created by Miracolo Bosco on 15/1/8.
//  Copyright (c) 2015年 MI-31. All rights reserved.
//

#import "HttpTool.h"
#import "DPAPI.h"
#import "DPRequest.h"

@interface HttpTool () <DPRequestDelegate>
@property (nonatomic, strong) DPAPI *api;
@property (nonatomic, copy) NSMutableDictionary *blocks;
@end

@implementation HttpTool

#pragma mark --- SingleTon
static HttpTool *sharedInstance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedInstance == nil) {
            
            sharedInstance = [[self alloc] init];
        }
    });
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return self;
}

- (DPAPI *)api
{
    if (!_api) {
        self.api = [[DPAPI alloc] init];
    }
    return _api;
}

- (NSMutableDictionary *)blocks
{
    if (! _blocks) {
        self.blocks = [NSMutableDictionary dictionary];
    }
    return _blocks;
}
- (void)requestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    DPRequest *request = [self.api requestWithURL:url params:[[NSMutableDictionary alloc] initWithDictionary:parameters] delegate:self];
//    self.blocks[request.description] = ^(id json, NSError *error){
//        if (success && json) {
//            success(json);
//        }else if (failure && error){
//            failure(error);
//        }
//    };
    request.sucess = success;
    request.failure = failure;
}

- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
//    void (^block)(id json, NSError *error) = self.blocks[request.description];
//    if (block) {
//        block(result, nil);
//    }
    if (request.sucess) {
        request.sucess(result);
    }
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error
{
//    void (^block)(id json, NSError *error) = self.blocks[request.description];
//    if (block) {
//        block(nil, error);
//    }
    if (request.failure) {
        request.failure(error);
    }
}
@end
