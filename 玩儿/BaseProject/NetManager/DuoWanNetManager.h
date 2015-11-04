//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "AllHeroModel.h"
#import "FreeHeroModel.h"
#import "HeroSkinModel.h"
#import "HeroVideoModel.h"
#import "HeroCZModel.h"
#import "HeroDetailModel.h"
#import "HeroGiftModel.h"
#import "HeroChangeModel.h"
#import "HeroWeekDataModel.h"
#import "ToolMenuModel.h"
#import "ZBCCategoryModel.h"
#import "ZBItemModel.h"
#import "ItemDetailModel.h"
#import "GiftModel.h"
#import "RuneModel.h"
#import "SumAbilityModel.h"
#import "BestGroupModel.h"

typedef NS_ENUM(NSUInteger, DuoWanType) {
    DuoWanTypeFree,    //免费英雄
    DuoWanTypeAll,     //全部英雄
    
};

@interface DuoWanNetManager : BaseNetManager
//免费+全部
+ (id)getHeroWithType:(DuoWanType)type completionHandle:(void(^)(id model, NSError *error))completionHandle;

//英雄皮肤
+ (id)getHeroSkinWithHero:(NSString *)hero kCompletionHandle;

//英雄配音
+ (id)getHeroSoundWithHeroName:(NSString *)name kCompletionHandle;

//英雄视频
+ (id)getHeroVideoWithTag:(NSString *)tag kCompletionHandle;

//英雄出装
+ (id)getHeroCZWithChampionName:(NSString *)name kCompletionHandle;

//英雄资料
+ (id)getHeroDetialWithHeroName:(NSString *)name kCompletionHandle;

//天赋符文
+ (id)getHeroGiftWithHeroName:(NSString *)name kCompletionHandle;

//英雄改动
+ (id)getHeroChangeWithName:(NSString *)name kCompletionHandle;

//一周数据
+ (id)getHeroWeekDataWithHeroId:(NSInteger)ID kCompletionHandle;

//游戏百科列表(不确定)
+ (id)getGameToolMenuWithCategory:(NSString *)tag kCompletionHandle;

//装备分类
+ (id)getZBCategory:(void(^)(id model, NSError *error))completionHandle;

//某分类装备详情(消耗品)
+ (id)getZBItemWithTag:(NSString *)tag kCompletionHandle;

//装备详情
+ (id)getItemDetailWithID:(NSString *)Id kCompletionHandle;

//天赋
+ (id)getGift:(void(^)(id model, NSError *error))comepletionHandle;

//符文列表
+ (id)getRunes:(void(^)(id model, NSError *error))comepletionHandle;

//召唤师技能列表
+ (id)getSumAbility:(void(^)(id model, NSError *error))comepletionHandle;

//最佳阵容
+ (id)getBestGroup:(void(^)(id model, NSError *error))comepletionHandle;


@end
