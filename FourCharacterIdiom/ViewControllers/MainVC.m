//
//  MainVC.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 26..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "MainVC.h"


@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 네비게이션바 텍스트 삽입 및 텍스트 설정
    [self.navigationItem setTitle:@"사자성어 "];
    
    
    UIImage *emptyImage = [[UIImage alloc]init];
    [self.searchBar setBackgroundImage:emptyImage];
    
    // 네비게이션바 우측 상단 버튼 추가.
    UIButton *topRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [topRightBtn setFrame:CGRectMake(0, 0, 17.5 , 4)];
    [topRightBtn setImage:[UIImage imageNamed:@"etc_n"] forState:UIControlStateNormal];
    [topRightBtn setImage:[UIImage imageNamed:@"etc_p"] forState:UIControlStateHighlighted];
     
    UIBarButtonItem *topRightBtnItem = [[UIBarButtonItem alloc]init];
    [topRightBtnItem setCustomView:topRightBtn];
    [self.navigationItem setRightBarButtonItem:topRightBtnItem];
    
}

#pragma mark - 테이블뷰 델리킷 구현

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}





@end
