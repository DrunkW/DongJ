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
    NSString *path = [self percentPathWithPath:kTuWanPath params:params];
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanModel objectWithKeyValues:responseObj], error);
    }];
}

//http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1
/*
 URL的结构是 ? 号 之前是地址, ?号之后是参数
 path:http://cache.tuwan.com/app/
 params:@{@"appid":@1,@"class":@"heronews", @"mod":@"八卦", @"appver":@"2.1"};
 */

//方法作用:把 path 和参数拼接起来,把字符串中的中文转换为 百分号形式,因为有的服务器不接收中文编码
+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params
{
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;
    /*习惯
     for(int i=0;i<params.allkeys.count;i++)
     假设 for 循环1000次, params.allkeys 实际上调用的[params allkeys],会调用 allkeys1000次. OC 语言特性是 runtime(运行时决定), 实际上我们调用一个方法,底层操作是在一个方法列表中搜索你调用的方法所在的地址,调用完毕之后把这个方法名转移到常用方法列表.如果再次执行某个方法就在常用方法列表中调用,效率更高.重复执行的方法效率更高,但是有搜索的过程.
     */
    for (int i=0; i<count; i++) {
        if (i == 0) {
            [percentPath appendFormat:@"?%@=%@",keys[i], params[keys[i]]];
            
        }else{
            [percentPath appendFormat:@"&%@=%@",keys[i], params[keys[i]]];
        }
    }
    //把字符串中的中文转为%号形式
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}


@end
