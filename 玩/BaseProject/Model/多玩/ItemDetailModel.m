//
//  ItemDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ItemDetailModel.h"

@implementation ItemDetailModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description", @"id":@"ID"};
}
@end


@implementation ItemDetailExtattrsModel

//属性首字母小写->大写
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName firstCharLower];
}
@end


