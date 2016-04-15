//
//  BJCircleClassifyViewController.m
//  展开列表
//
//  Created by 刘俊杰 on 16/4/15.
//  Copyright © 2016年 BuJiong. All rights reserved.
//

#import "BJCircleClassifyViewController.h"
#import "BJCircleClassifyHeaderView.h"
#import "BJClassifyFristBtnModel.h"
#import "YYModel/YYModel.h"
#import "BJCircleClassifyCell.h"
#import "SDAutoLayout/UITableView+SDAutoTableViewCellHeight.h"

@interface BJCircleClassifyViewController ()
@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,strong)NSMutableDictionary *headerDict;
@property (strong, nonatomic) BJClassifyFristBtnResultModel *resultModel;
@property (strong, nonatomic) NSArray<BJClassifyFristBtnModel *> *selectedArray;
@end

@implementation BJCircleClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];;
    NSString *path = [doc stringByAppendingPathComponent:@"classifyTopList.json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    _resultModel = [BJClassifyFristBtnResultModel yy_modelWithJSON:data];
    
    // 1. 初始化字典 存放列表
    self.headerDict = [NSMutableDictionary dictionaryWithCapacity:5];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    // 2. 设置标题行高
    [self.tableView setSectionHeaderHeight:kHeaderHeight];
    //3.注册 cell
    [self.tableView registerClass:[BJCircleClassifyCell class] forCellReuseIdentifier:bj_CircleClassifyCell];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _resultModel.result.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BJCircleClassifyHeaderView *header = self.headerDict[@(section)];
    
    if (header.isOpen) {
        return 1;
    }else{
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BJCircleClassifyCell *cell = [tableView dequeueReusableCellWithIdentifier:bj_CircleClassifyCell];
    
    cell.fristBtnModels = self.selectedArray;
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    BJCircleClassifyHeaderView *header = self.headerDict[@(section)];
    
    if (header == nil) {
        header = [[BJCircleClassifyHeaderView alloc] initWithReuseIdentifier:bj_CircleClassifyHeaderView];
        header.isOpen = NO;
        [header headerClick:^(BJCircleClassifyHeaderView *myHeader) {
            BJCircleClassifyHeaderView *myHeader1 = self.headerDict[@(myHeader.section)];
            [myHeader1 setIsOpen:!myHeader1.isOpen];
            self.selectedArray = self.resultModel.result[myHeader.section].sub;
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:header.section] withRowAnimation:UITableViewRowAnimationFade];
            
        }];
        header.btnTitle = _resultModel.result[section].name;
        [self.headerDict setObject:header forKey:@(section)];
        
    }
    [header setSection:section];
    return  header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView cellHeightForIndexPath:indexPath model:self.selectedArray keyPath:@"fristBtnModels" cellClass:[BJCircleClassifyCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}
@end
