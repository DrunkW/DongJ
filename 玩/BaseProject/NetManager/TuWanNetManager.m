//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"
#define kTuWanPath   @"http://cache.tuwan.com/app/"
#define kAppid   @"appid":@1
#define kAppver  @"appver":@2.1
#define kClassmore   @"classmore":@"indexpic"

@implementation TuWanNetManager

+ (id)getTuWanListType:(TuWanListType)type start:(NSInteger)start completionHandle:(void (^)(TuWanModel *, NSError *))completionHandle
{
    NSDictionary *params = nil;
    switch (type) {
        case TuWanListTypeCOS:
            params = @{kAppid,@"class":@"cos",@"mod":@"cos",kClassmore, @"dtid":@"0",kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeAnHei:
            params = @{kAppid, @"dtid":@"83623",kClassmore,kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeDuJia:
            params = @{kAppid,@"class":@"heronews",@"mod":@"八卦", kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeLuShi:
            params = @{kAppid, @"dtid":@"31528",kClassmore,kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeMeiNv:
            params = @{kAppid,@"class":@"heronews",@"mod":@"美女",kClassmore,@"typechild":@"cos1", kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeQuWen:
            params = @{kAppid,@"dtid":@"0",@"class":@"heronews",@"mod":@"趣闻",kClassmore, kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeMoShou:
            params = @{kAppid, @"dtid":@"31537",kClassmore,kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeTuPian:
            params = @{kAppid,@"type":@"pic", @"dtid":@"83623,31528,31537,31538,57067,91821",kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeXingJi:
            params = @{kAppid, @"dtid":@"91821",kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeFengBao:
            params = @{kAppid, @"dtid":@"31538",kClassmore,kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeGonglue:
            params = @{kAppid,@"type":@"guide", @"dtid":@"83623,31528,31537,31538,57067,91821",kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeHuanHua:
            params = @{kAppid,@"class":@"heronews",@"mod":@"幻化", kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeShiPing:
            params = @{kAppid,@"type":@"video", @"dtid":@"83623,31528,31537,31538,57067,91821",kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeTouTiao:
            params = @{kAppid,kClassmore,kAppid,kAppver,@"start":@(start)};
            break;
        case TuWanListTypeShouWang:
            params = @{kAppid, @"dtid":@"57067",kAppid,kAppver,@"start":@(start)};
            break;
            default:
            break;
    }
    //因为兔玩服务器的要求，传入参数不能为中文，需要转化为%号形式
    NSString *path = [self percentPathWithPath:kTuWanPath params:params];
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanModel objectWithKeyValues:responseObj], error);
    }];
}



@end
