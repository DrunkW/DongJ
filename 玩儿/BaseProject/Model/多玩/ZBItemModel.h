//
//  ZBItemModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ZBItemModel;
@interface ZBItemModel : BaseModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *text;

@end

