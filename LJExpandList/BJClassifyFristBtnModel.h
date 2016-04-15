//
//  BJClassifyFristBtnModel.h
//  下拉菜单
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BJClassifyFristBtnModel;

@interface BJClassifyFristBtnResultModel : NSObject
@property (copy, nonatomic) NSArray<BJClassifyFristBtnModel *> *result;
@end

@interface BJClassifyFristBtnModel : NSObject
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) NSInteger infoCount;
@property (copy, nonatomic) NSArray<BJClassifyFristBtnModel *> *sub;

@end
