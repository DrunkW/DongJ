//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"

//只要公用一个解析类的请求,就可以合起来写,只需要使用枚举类型,来决定不同的请求地址即可
//可以参考汽车之家接口
typedef NS_ENUM(NSUInteger, TuWanListType) {
    TuWanListTypeDuJia,     //独家
    TuWanListTypeTouTiao,   //头条
    TuWanListTypeAnHei,     //暗黑3
    TuWanListTypeMoShou,    //魔兽
    TuWanListTypeFengBao,   //风暴
    TuWanListTypeLuShi,     //炉石
    TuWanListTypeXingJi,    //星际2
    TuWanListTypeShouWang,  //守望
    TuWanListTypeTuPian,    //图片
    TuWanListTypeShiPing,   //视频
    TuWanListTypeGonglue,   //攻略
    TuWanListTypeHuanHua,   //幻化
    TuWanListTypeQuWen,     //趣闻
    TuWanListTypeCOS,       //COS
    TuWanListTypeMeiNv      //美女
};

@interface TuWanNetManager : BaseNetManager
/**
 *  获取某种类型的资讯
 *
 *  @param type  资讯类型
 *  @param start 当前资讯起始索引值，最小为0。 eg 0,11,22,33,44...
 *
 *  @return 请求所在任务
 */
+ (id)getTuWanListType:(TuWanListType)type start:(NSInteger)start completionHandle:(void(^)(TuWanModel *model, NSError *error))completionHandle;

@end
