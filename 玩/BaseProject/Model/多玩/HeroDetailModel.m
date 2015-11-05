//
//  HeroDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroDetailModel.h"

@implementation HeroDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"like" : [HeroDetailLikeModel class], @"hate" : [HeroDetailLikeModel class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description", @"ID":@"ID"};
}

@end


@implementation HeroDetailBraumQModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description", @"ID":@"id"};
}

@end


@implementation HeroDetailLikeModel

@end




