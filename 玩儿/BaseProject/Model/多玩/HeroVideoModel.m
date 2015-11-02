//
//  HeroVideoModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroVideoModel.h"

@implementation HeroVidoeModel

+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"totalPage"]||[propertyName isEqualToString:@"channelId"]) {
        return propertyName;
    }
    //驼峰转下划线 (loveYou-->love_you)
    return [propertyName underlineFromCamel];
}

@end


