//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuWanNetManager.h"
#import "XiMaNetManager.h"
#import "DuoWanNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    
    /* 兔玩测试 */
    [TuWanNetManager getTuWanListType:TuWanListTypeAnHei start:0 completionHandle:^(TuWanModel *model, NSError *error) {
        DDLogVerbose(@".....");
    }];
    
    /* 西门拉雅测试 */
    [XiMaNetManager getRankingListWithPageId:2 completionHandle:^(RankingListModel *model, NSError *error) {
        DDLogVerbose(@".....");
    }];
    
    /* 西门拉雅测试 */
    [XiMaNetManager getAlbumWithID:3092772 pageID:1 completionHandle:^(AlbumModel *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /*多玩 全部,免费  */
    [DuoWanNetManager getHeroWithType:DuoWanTypeAll completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    [DuoWanNetManager getHeroWithType:DuoWanTypeFree completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 多玩 英雄皮肤 */
    [DuoWanNetManager getHeroSkinWithHero:@"Braum" completionHandle:^(NSArray *model, NSError *error) {
        DDLogVerbose(@"");
    }];
    /* 多玩 英雄视频  */
    [DuoWanNetManager getHeroVideoWithTag:@"Braum" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 英雄配音 */
    [DuoWanNetManager getHeroSoundWithHeroName:@"Braum3" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    /* 出装 */
    [DuoWanNetManager getHeroCZWithChampionName:@"Braum" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 资料 */
    [DuoWanNetManager getHeroDetialWithHeroName:@"Ashe" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 天赋符文 */
    [DuoWanNetManager getHeroGiftWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 英雄改动 */
    [DuoWanNetManager getHeroChangeWithName:@"Braum" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 一周数据 */
    [DuoWanNetManager getHeroWeekDataWithHeroId:72 completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 百科列表 */
    [DuoWanNetManager getGameToolMenuWithCategory:@"video" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 装备分类 */
    [DuoWanNetManager getZBCategory:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 某分类装备列表 */
    [DuoWanNetManager getZBItemWithTag:@"consumable" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 装备详情 */
    [DuoWanNetManager getItemDetailWithID:@"2003" completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    
    /* 天赋  */
    [DuoWanNetManager getGift:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    /* 符文列表  */
    [ DuoWanNetManager getRunes:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    /* 技能列表  */
    [DuoWanNetManager getSumAbility:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    /* 最佳阵容  */
    [DuoWanNetManager getBestGroup:^(id model, NSError *error) {
        DDLogVerbose(@"");
    }];
    return YES;
}

@end
