//
//  BaseNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
// 此处添加了 @"text/plain"   这样才能够解析 喜马拉雅 第二个请求
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    });
    return manager;
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
     假设 for 循环1000次, params.allkeys 实际上调用的[params allkeys],会调用 allkeys1000次. OC 语言特性是 runtime(运行时决定), 实际上我们调用一个方法,底层操作是在一个方法列表中搜索你调用的方法所在的地址,然后调用完毕之后把这个方法名转移到常用方法列表.如果再次执行某个方法就在常用方法列表中调用,效率更高.重复执行的方法效率更高,但是有搜索的过程.
     */
    
    /*
     假设 for 循环1000次,params.allkeys 实际上调用的[params allkeys],会调用allkeys1000次. OC 语言特性是 runtime, 实际上我们调用一个方法,底层操作是有俩个方法的列表,常用表和总列表. CPU 先在常用表中搜索调用的方法指针,如果找不到,再到总列表中搜索,在总列表中搜索你调用的方法所在的地址,然后调用完毕之后把这个方法名转移到常用方法列表.如果再次执行某个方法就在常用方法列表中搜索调用,效率更高.但是毕竟每次搜索方法都是耗时的,而 swift 语言则没有运行时,即没有这个搜索过程,这是 swift 比 OC 效率高20%的原因,为了避免搜索耗时,我们在 for 循环外部就把调用次数算出来,这样每次 for 循环只需要取 count 所在地址读变量值即可,这样 for 循环效率更高.
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


+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    
    //打印网络请求， DDLog  与  NSLog 功能一样
    DDLogVerbose(@"Request Path: %@, Params:%@", path, params);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        [self handleError:error];
        complete(nil, error);
    }];
}

+ (void)handleError:(NSError *)error{
    [[self new] showErrorMsg:error]; //弹出错误信息
}

@end
