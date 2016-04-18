//
//  BJCircleClassifyCell.h
//  展开列表
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BJClassifyFristBtnModel,BJCircleClassifyCell;

@protocol BJCircleClassifyCellDelegate <NSObject>
@required
- (void)circleClassifyCell:(BJCircleClassifyCell *)cell didSelectedLabelText:(NSString *)text;

@end

@interface BJCircleClassifyCell : UITableViewCell
@property (strong, nonatomic) NSArray<BJClassifyFristBtnModel *> *fristBtnModels;
@property (weak, nonatomic) id<BJCircleClassifyCellDelegate> delegate;
@property (strong, nonatomic) NSIndexPath *indexPath;
@end
UIKIT_EXTERN NSString * const bj_CircleClassifyCell;