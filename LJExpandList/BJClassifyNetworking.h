//
//  BJClassifyNetworking.h
//  下拉菜单
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class BJClassifyFristBtnResultModel;

NS_ASSUME_NONNULL_BEGIN
@interface BJClassifyNetworking : NSObject
+ (instancetype)sharedNetworking;

//- (void)networkGetFristBtn:(void(^)(BJClassifyFristBtnResultModel *model)) block ;

/**
 *    @{@"friendId":String
        @"currPage":,Long
        @"pageSize":,Long
        @"cate":,Integer
        @"subCate":,Integer
        @"cateProps":,List<String> cateProps
        @"lng":,String
        @"lat":String
 }
 *
 *
 */

//- (void)networkPostWithParam:(NSDictionary *)param block:(void(^)(BJClassifyModel *model)) block;
- (void)loadURLRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData * _Nullable data))completionHandler;
@end
NS_ASSUME_NONNULL_END