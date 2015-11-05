//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
#import "DuoWanRequestPath.h"

//很多具有共同点的东西,可以统一宏定义,比如
//凡是自己写的宏定义,都需要 k 开头,这是编码习惯
#define kOSType   @"OSType":@"iOS9.1" //9.1是当前手机系统版本,需要到 info 文件中去取
#define kV   @"v":@140
#define kVersion   @"versionName":@"2.4.0"

#define kChangeKey(key)    [dic setObject:[dic objectForKey:[name stringByAppendingString:key]]\
forKey:[@"desc" stringByAppendingString:key]];\
[dic removeObjectForKey:[name stringByAppendingString:key]]


//把 path 写到文件头部,使用宏定义形式,方便后期维护


@implementation DuoWanNetManager

//免费+全部英雄
+ (id)getHeroWithType:(DuoWanType)type completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = nil;
    switch (type) {
        case DuoWanTypeFree: {
            params = @{@"type":@"free",kV,kOSType};
            return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case DuoWanTypeAll: {
            params = @{@"type":@"all",kV,kOSType};
            return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
                completionHandle([AllHeroModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        default: {
            break;
        }
    }
}

//英雄皮肤
+ (id)getHeroSkinWithHero:(NSString *)hero completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{ @"hero":hero,kOSType,kV, kVersion};
    return [self GET:kHeroSkinPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroSkinModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

//英雄配音
+ (id)getHeroSoundWithHeroName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroSoundPath parameters:@{@"hero":name,kV,kOSType,kVersion} completionHandler:^(id responseObj, NSError *error) {
        completionHandle(responseObj, error);
    }];
}

//英雄视频
+ (id)getHeroVideoWithTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroVideoPath parameters:@{@"action":@"l",@"p":@1,kV,kOSType,@"tag":tag,@"src":@"letv"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroVidoeModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

//英雄出装
+ (id)getHeroCZWithChampionName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroCZPath parameters:@{kV,kOSType,@"championName":name,@"limit":@7} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroCZModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

//英雄资料
+ (id)getHeroDetialWithHeroName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroDetailPath parameters:@{kOSType,@"heroName":name,kV} completionHandler:^( id responseObj, NSError *error) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObj];
        kChangeKey(@"_Q");
        kChangeKey(@"_W");
        kChangeKey(@"_E");
        kChangeKey(@"_R");
        kChangeKey(@"_B");
        completionHandle([HeroDetailModel objectWithKeyValues:dic], error);
    }];
}

//天赋符文
+ (id)getHeroGiftWithHeroName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kGiftAndRunPath parameters:@{@"hero":name,kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroGiftModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

//英雄改动
+ (id)getHeroChangeWithName:(NSString *)name completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroInfoPath parameters:@{@"name":name,kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChangeModel objectWithKeyValues:responseObj],error);
    }];
}

//一周数据
+ (id)getHeroWeekDataWithHeroId:(NSInteger)ID completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kHeroWeekDataPath parameters:@{@"heroId":@(ID)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroWeekDataModel objectWithKeyValues:responseObj], error);
    }];
}

//百科列表
+ (id)getGameToolMenuWithCategory:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kToolMenuPath parameters:@{@"category":tag, kV,kOSType,kVersion} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ToolMenuModel objectArrayWithKeyValuesArray:responseObj], error);
    }];

}

//装备分类
+ (id)getZBCategory:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kZBCategoryPath parameters:@{kV,kOSType,kVersion} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBCCategoryModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

//某分类装备列表
+ (id)getZBItemWithTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kZBItemListPath parameters:@{@"tag":tag,kV,kOSType,kVersion} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBItemModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
    
//装备详情
+ (id)getItemDetailWithID:(NSString *)Id completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [self GET:kItemDetailPath parameters:@{@"id":Id,kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ItemDetailModel objectWithKeyValues:responseObj], error);
    }];
}

//天赋
+ (id)getGift:(void(^)(id model, NSError *error))comepletionHandle
{
    return [self GET:kGiftPath parameters:@{kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        comepletionHandle([GiftModel objectWithKeyValues:responseObj],error);
    }];
}

//符文列表
+ (id)getRunes:(void(^)(id model, NSError *error))comepletionHandle
{
    return [self GET:kRunesPath parameters:@{kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        comepletionHandle([RuneModel objectWithKeyValues:responseObj],error);
    }];

}

//召唤师技能列表
+ (id)getSumAbility:(void(^)(id model, NSError *error))comepletionHandle
{
    return [self GET:kSumAbilityPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        comepletionHandle([SumAbilityModel objectArrayWithKeyValuesArray:responseObj], error);
    }];

}

//最佳阵容
+ (id)getBestGroup:(void(^)(id model, NSError *error))comepletionHandle
{
    return [self GET:kBestGroupPath parameters:@{kV,kOSType} completionHandler:^(id responseObj, NSError *error) {
        comepletionHandle([BestGroupModel objectArrayWithKeyValuesArray:responseObj],error);
    }];

}










@end
