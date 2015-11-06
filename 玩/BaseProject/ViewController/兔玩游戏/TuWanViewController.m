//
//  TuWanViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListViewController.h"

@interface TuWanViewController ()

@end

@implementation TuWanViewController



+ (UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [[TuWanViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemsNames]];
        //例如设置第一个控制器的某个属性的值, KVC
        //vc setValue:[values[0]] forKey:keys[0]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
/** 提供每个 VC 对应的 key 值数组 */
+ (NSArray *)vcKeys
{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemsNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供每个 VC 对应的 value 值数组 */
+ (NSArray *)vcValues
{
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i =0; i<[self itemsNames].count; i++) {
    //数值上, vc 的 infoType 的枚举值,恰好和 i 值相同
        [arr addObject:@(i)];
    }
    return [arr copy];
}
/** 提供题目数组 */
+ (NSArray *)itemsNames
{
    return @[@"独家",@"头条",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
/** 提供每个题目对应的控制器类型.题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemsNames]) {
        [arr addObject:[TuWanListViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"Tu玩";
    
    [Factory addMenuItemToVc:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
