//
//  HomeViewController.m
//  知乎
//
//  Created by ROOSTERLIN on 2017/1/11.
//  Copyright © 2017年 ROOSTERLIN. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "LastestModel.h"
#import "StoriesModel.h"

#define CELLID @"HomeCell"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *datas;
@end

@implementation HomeViewController


#pragma mark 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:CELLID];//什么意思
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    [self getLatest];
}

#pragma mark - 获取新闻数据
- (void)getLatest{
    [[AFHTTPSessionManager manager] GET:@"http://news-at.zhihu.com/api/4/news/latest"
                             parameters:nil
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

                                    
                                    [LastestModel mj_setupObjectClassInArray:^NSDictionary *{
                                        return @{
                                                 @"stories":@"StoriesModel"
                                                 };
                                    }];
                                    
                                    LastestModel *model = [LastestModel mj_objectWithKeyValues:responseObject];
                                    self.datas = model.stories.mutableCopy;
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    
                                }];
}


#pragma mark - UITableView Delegate & DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    cell.model = self.datas[indexPath.row];
    return cell;
}

- (void)setDatas:(NSMutableArray *)datas{
    _datas = datas;
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
