//
//  BJCircleClassifyHeaderView.h
//  展开列表
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kHeaderHeight 50
@class BJCircleClassifyHeaderView;
typedef void(^headerBlock)(BJCircleClassifyHeaderView *myHeader);
@interface BJCircleClassifyHeaderView : UITableViewHeaderFooterView
// 是否展开折叠标记
@property(nonatomic,assign) BOOL isOpen;
// 标题栏分组
@property (assign, nonatomic) NSInteger section;
@property (copy, nonatomic) NSString *btnTitle;
- (void)headerClick:(headerBlock )block;
@end
UIKIT_EXTERN NSString * const bj_CircleClassifyHeaderView;