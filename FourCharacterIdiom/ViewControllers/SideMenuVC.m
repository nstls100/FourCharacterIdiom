//
//  SideMenuVC.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 30..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "SideMenuVC.h"

@interface SideMenuVC ()

@end

@implementation SideMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 뷰 헤더 지정.
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    headerView.backgroundColor = UIColorFromRGB(0x5F88E9);
    self.tableView.tableHeaderView = headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 테이블뷰 델리킷 구현

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    NSString *text = nil;
    
    if (row == 0){
        text = @"사자성어";
    }else if (row == 1){
        text = @"학습";
    }else if (row == 2){
        text = @"문제풀이";
    }else if (row == 3){
        text = @"나만의 단어장";
    }
    
    cell.textLabel.text = text;

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealController = self.revealViewController;
    
    if(indexPath.row == 0 ){
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainVC"];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [revealController pushFrontViewController:navigationController animated:YES];
    }
    else if (indexPath.row == 3)
    {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"myWordVC"];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];

        [revealController pushFrontViewController:navigationController animated:YES];
    }
}



@end
