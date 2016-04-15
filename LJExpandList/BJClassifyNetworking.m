//
//  BJClassifyNetworking.m
//  下拉菜单
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import "BJClassifyNetworking.h"
//#import <YYModel/YYModel.h>
//#import "NSDictionary+LJURL.h"
#import "BJClassifyFristBtnModel.h"
//#import "BJClassifyModel.h"

@implementation BJClassifyNetworking
static BJClassifyNetworking *_instance = nil;
+ (instancetype)sharedNetworking {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[BJClassifyNetworking alloc] init];
    });
    return _instance;
}

//- (void)networkGetFristBtn:(void(^)(BJClassifyFristBtnResultModel *model)) block{
//    NSURL *url = [NSURL URLWithString:@"http://192.168.1.20:8083/cps/api/category.do?act=getCategoryList"];
//     NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
//    
//    [self loadURLRequest:request completionHandler:^(NSData * _Nullable data) {
//        BJClassifyFristBtnResultModel *model =[BJClassifyFristBtnResultModel yy_modelWithJSON:data];
//            if (block) block(model);
//    }];
//    
//}

//- (void)networkPostWithParam:(NSDictionary *)param block:(void(^)(BJClassifyModel *model)) block{
//    NSString *paramString = [param toURLString];
//    NSString *urlStr = @"moments/getMomentsWithCate" ;
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://192.168.1.19:8080/",urlStr]];
//   NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
//    request.HTTPMethod = @"POST";
//    request.HTTPBody = [paramString dataUsingEncoding:NSUTF8StringEncoding];
//    
//    [self loadURLRequest:request completionHandler:^(NSData * _Nullable data) {
//        BJClassifyModel *model =[BJClassifyModel yy_modelWithJSON:data];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (block) {
//                block(model);
//            }
//        });
//    }];
//}

#pragma mark networking
- (void)loadURLRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData * _Nullable data))completionHandler{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (completionHandler) {
            NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
            if (!error&&httpURLResponse.statusCode == 200) {
                completionHandler(data);
            }else {
                completionHandler(nil);
            }
            
        }
    }];
    [dataTask resume];
}


@end
