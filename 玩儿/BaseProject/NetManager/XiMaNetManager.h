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

+ (id)getRankingListWithPageId:(NSInteger)pageId completionHandle:(void(^)(RankingListModel *model, NSError *error))completionHandle;


+ (id)getAlbumWithID:(NSInteger)ID pageID:(NSInteger)pageID completionHandle:(void(^)(AlbumModel *model, NSError *error))completionHandle;

@end
