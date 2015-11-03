//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
//只要公用一个解析类的请求,就可以合起来写,只需要使用枚举类型,来决定不同的请求地址即可
//可以参考汽车之家接口
typedef NS_ENUM(NSUInteger, TuWanListType) {
    TuWanListTypeDuJia,     //独家
    TuWanListTypeTouTiao,   //头条
    TuWanListTypeAnHei,     //暗黑3
    TuWanListTypeMoShou,    //魔兽
    TuWanListTypeFengBao,   //风暴
    TuWanListTypeLuShi,     //炉石
    TuWanListTypeXingJi,    //星际
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



@end
