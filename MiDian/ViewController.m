//
//  ViewController.m
//  MiDian
//
//  Created by Miracolo Bosco on 15/1/8.
//  Copyright (c) 2015年 MI-31. All rights reserved.
//

#import "ViewController.h"
#import "HttpTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HttpTool *httpTool = [HttpTool shareInstance];
    
    NSMutableDictionary *params1 = [NSMutableDictionary dictionary];
    params1[@"city"] = @"北京";
    params1[@"region"] = @"朝阳区";
    params1[@"category"] = @"美发";
    [httpTool requestWithUrl:@"v1/deal/find_deals" parameters:params1 success:^(id json) {
        NSLog(@"北京-请求成功---%@", json);
    } failure:^(NSError *error) {
        NSLog(@"北京-请求失败---%@", error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
