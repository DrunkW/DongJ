//
//  XiMaNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"

@interface XiMaNetManager : BaseNetManager
/**
 *  获取音乐分类列表 top50
 *
 *  @param pageId  当前页数从1开始, eg 1,2,3,4,5..
 *
 *  @return 返回当前请求所在的任务
 */
+ (id)getRankingListWithPageId:(NSInteger)pageId completionHandle:(void(^)(RankingListModel *model, NSError *error))completionHandle;

/**
 *  根据音乐组类型 ID 获取对应音乐列表,两个参数的确定完全是靠经验,
 *
 *  @param ID               音乐组 ID
 *  @param pageID           当前页数,从1开始
 *
 *  @return 返回当前请求所在任务
 */
+ (id)getAlbumWithID:(NSInteger)ID pageID:(NSInteger)pageID completionHandle:(void(^)(AlbumModel *model, NSError *error))completionHandle;

@end
