//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel
- (instancetype)initWithType:(TuWanListType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
//预防性编程,防止没有使用 initWithType 初始化
- (id)init
{
    if (self = [super init]) {
//如果使用此方法初始化,那么崩溃提示
        NSAssert(NO, @"%s 必须使用 initWithType 初始化", __func__);
    }
    return self;
}

//刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取数据
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
     self.dataTask = [TuWanNetManager getTuWanListType:_type  start:_start completionHandle:^(TuWanModel *model, NSError *error) {
         if (_start == 0) {
             [self.dataArr removeAllObjects];
             self.indexPicArr = nil;
         }
         [self.dataArr addObjectsFromArray:model.data.list];
         self.indexPicArr = model.data.indexpic;
         
         completionHandle(error);
     }];
}
/** 是否有头部滚动栏 */
- (BOOL)isExistIndexPic
{
    return self.indexPicArr != nil && self.indexPicArr.count != 0;
}

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

- (TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row
{
    return arr[row];
}

/** 根据 showtype 0是没有图,1是有图 */
- (BOOL)containImages:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}

/** 通过行数,返回此行中对应的图片链接数组 */
- (NSArray *)iconURLSForRowInList:(NSInteger)row
{
    NSArray *arr = [self modelForArr:self.dataArr row:row].showitem;
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < arr.count; i ++) {
        TuWanDataIndexpicShowitemModel *model = arr[i];
        [array addObject:[NSURL URLWithString:model.pic]];
    }
    return [array copy];
}

//列表
/** 返回列表中某行数据的题目 */
- (NSString *)titleForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].title;
}
/** 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRowInList:(NSInteger)row
{
    NSString *path = [self modelForArr:self.dataArr row:row].litpic;
    return [NSURL URLWithString:path];
}
/** 返回列表中某行数据的浏览人数 */
- (NSString *)clicksForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].click;
}
/** 返回列表中某行数据的描述 */
- (NSString *)descForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].longtitle;
}
/** 获取列表中某行数据对应的 html5链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5];
}

//滚动展示栏
/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowIndexPic:(NSInteger)row
{
    NSString *path = [self modelForArr:self.dataArr row:row].litpic;
    return [NSURL URLWithString:path];
}
/** 滚动展示栏的文字 */
- (NSString *)titleForRowIndexPic:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].title;
}
/** 滚动展示栏的图片数量 */
- (NSInteger)indexPicNumber
{
    return self.indexPicArr.count;
}
/** 获取展示栏中某行数据对应的 html5链接 */
- (NSURL *)detailURLForRowIndexPic:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5];
}

@end
