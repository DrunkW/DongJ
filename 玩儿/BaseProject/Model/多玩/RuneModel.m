//
//  RuneModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RuneModel.h"

@implementation RuneModel
//首字母大写
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName firstCharLower];
}

+ (NSDictionary *)objectClassInArray{
    return @{@"Purple" : [RunePurpleModel class], @"Yellow" : [RunePurpleModel class], @"Blue" : [RunePurpleModel class], @"Red" : [RunePurpleModel class]};
}
@end
@implementation RunePurpleModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"img":@"Img", @"name":@"Name", @"recom":@"Recom", @"units":@"Units", @"type":@"Type",@"standby":@"Standby",@"alias":@"Alias", @"prop":@"Prop"};
}
@end



