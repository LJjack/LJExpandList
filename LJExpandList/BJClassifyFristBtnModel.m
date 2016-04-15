//
//  BJClassifyFristBtnModel.m
//  下拉菜单
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import "BJClassifyFristBtnModel.h"

@implementation BJClassifyFristBtnResultModel
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"result":[BJClassifyFristBtnModel class]};
}
@end

@implementation BJClassifyFristBtnModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{@"ID":@"id"};
}
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"sub":[BJClassifyFristBtnModel class]};
}
@end
