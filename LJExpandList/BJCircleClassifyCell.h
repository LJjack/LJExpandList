//
//  BJCircleClassifyCell.h
//  展开列表
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BJClassifyFristBtnModel;
@interface BJCircleClassifyCell : UITableViewCell
@property (strong, nonatomic) NSArray<BJClassifyFristBtnModel *> *fristBtnModels;
@end
UIKIT_EXTERN NSString * const bj_CircleClassifyCell;