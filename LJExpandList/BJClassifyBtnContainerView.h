//
//  BJClassifyBtnContainerView.h
//  展开列表
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BJClassifyBtnContainerViewBlock)(NSString *clickLabelText);

@interface BJClassifyBtnContainerView : UIView
@property (nonatomic, strong) NSArray *labelTextsArray;
- (instancetype)initWithBlock:(BJClassifyBtnContainerViewBlock) block ;//点击label事件
@end
