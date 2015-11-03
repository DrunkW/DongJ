//
//  XiMaNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaNetManager.h"

#define kRankingListPath  @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album"
#define kAlbumPath   @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20"



@implementation XiMaNetManager

+ (id)getRankingListWithPageId:(NSInteger)pageId completionHandle:(void (^)(RankingListModel *, NSError *))completionHandle
{
    //只能使用单独传参方式。  使用地址+参数字符串 会导致程序崩溃!所以讲地址中的 % 去掉了.
    NSDictionary *params = @{@"device":@"iPhone", @"key":@"ranking:album:played:1:2", @"pageId":@(pageId), @"pageSize": @20, @"position": @0, @"title": @"排行榜"};
    return [self GET:kRankingListPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RankingListModel objectWithKeyValues:responseObj],error);
    }];
}


+ (id)getAlbumWithID:(NSInteger)ID pageID:(NSInteger)pageID completionHandle:(void (^)(AlbumModel *, NSError *))completionHandle
{
    //  %@  已经拼入 宏定义 kAlbumPath 中
    NSString *path = [NSString stringWithFormat:kAlbumPath,@(ID), @(pageID)];
    return [self GET:path parameters:@{@"device":@"iPhone"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AlbumModel objectWithKeyValues:responseObj], error);
    }];
}









@end
