//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanViewModel : BaseViewModel
@property (nonatomic) NSInteger rowNumber;
/** 判断某一行数据是否有图 */
- (BOOL)containImages:(NSInteger)row;

/** 返回列表中某行数据的题目 */
- (NSString *)titleForRowInList:(NSInteger)row;
/** 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRowInList:(NSInteger)row;
/** 返回列表中某行数据的浏览人数 */
- (NSString *)clicksForRowInList:(NSInteger)row;
/** 返回列表中某行数据的描述 */
- (NSString *)descForRowInList:(NSInteger)row;
/** 通过行数,返回此行中对应的图片链接数组 */
- (NSArray *)iconURLSForRowInList:(NSInteger)row;


/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowIndexPic:(NSInteger)row;
/** 滚动展示栏的文字 */
- (NSString *)titleForRowIndexPic:(NSInteger)row;
/** 滚动展示栏的图片数量 */
@property (nonatomic) NSInteger indexPicNumber;

/** 获取列表中某行数据对应的 html5链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row;
/** 获取展示栏中某行数据对应的 html5链接 */
- (NSURL *)detailURLForRowIndexPic:(NSInteger)row;

/**存放头部滚动栏 */
@property (strong,nonatomic) NSArray *indexPicArr;
/** 是否有头部滚动栏 */
@property (nonatomic, getter=isExistIndexPic)BOOL existIndexPic;
/** 必须使用此初始化方法,需要一个类型 */
- (instancetype)initWithType:(TuWanListType)type;
@property (nonatomic)TuWanListType type;

@property (nonatomic) NSInteger start;//当前页数索引值



@end
