//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanListCell.h"
#import "TuWanViewModel.h"
#import "TuWanImageCell.h"

@interface TuWanListViewController ()
@property (strong,nonatomic) TuWanViewModel *tuwanVM;
@end

@implementation TuWanListViewController

- (TuWanViewModel *)tuwanVM {
    if(_tuwanVM == nil) {
        _tuwanVM = [[TuWanViewModel alloc] initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
           [self.tableView.header endRefreshing];
           [self.tableView reloadData];
       }];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.tableView.footer endRefreshing];
           [self.tableView reloadData];
       }];
    }];
    
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuwanVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.tuwanVM containImages:indexPath.row]) {
        TuWanImageCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ImageCell" ];
        cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
        cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV1.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
        [cell.iconIV2.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_3"]];
        
        return cell;
    }
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    //图片没有下载完成之前显示的图片
    [cell.iconIV.imageView setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
    cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text = [self.tuwanVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
    
    return cell;
}
/** 去掉分割线左侧空隙 */
kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.tuwanVM containImages:indexPath.row]?135:90;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
