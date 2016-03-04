//
//  HYPHomeTableViewController.m
//  HYPWeiBo
//
//  Created by 郝一鹏 on 16/3/3.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "HYPHomeTableViewController.h"
#import "LogInViewController.h"
#import "HYPDataSource.h"

@interface HYPHomeTableViewController ()



@end

@implementation HYPHomeTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviItem];
    
    [self loadLogInViewController];
    
}

- (void)setNaviItem{
    UIButton *naviItemCenterBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    naviItemCenterBtn.backgroundColor = [UIColor whiteColor];
    naviItemCenterBtn.titleLabel.tintColor = [UIColor blackColor];
    
    [naviItemCenterBtn setTitle:@"首页" forState:UIControlStateNormal];
    [naviItemCenterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [naviItemCenterBtn addTarget:self action:@selector(touchNaviCenterView:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = naviItemCenterBtn;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发微博" style:UIBarButtonItemStylePlain target:self action:@selector(sendMessage:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"朋友" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)touchNaviCenterView:(id)sender{
    NSLog(@"触摸了navi中间视图");
}

- (void)sendMessage:(id)sender{
    UIViewController *testController = [[UIViewController alloc] init];
    testController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:testController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadLogInViewController{
    LogInViewController *logVC = [[LogInViewController alloc] init];
    [self.navigationController pushViewController:logVC animated:YES];
    [self.navigationController setNavigationBarHidden:YES];
    [logVC hidesBottomBarWhenPushed];
}

//- (void)viewWillAppear:(BOOL)animated{
//    NSLog(@"viewWillAppear:");
//    [self loadData];
//}
//
//- (void)loadData{
//    NSLog(@"loadData");
//    NSDictionary *pubilcWeibo = [[HYPDataSource sharedStore] getPublicWeibo];
//    NSLog(@"%@",pubilcWeibo);
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
