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
    
    // mainbundle에 있는 db 파일을 Document에 복사.
    [[IdiomLib sharedIdiomLib] copyDbFile];

    
    // 네비게이션바 텍스트 삽입 및 텍스트 설정
    [self.navigationItem setTitle:@"사자성어 "];
    
    // 서치바 백그라운드 색상 설정.
    UIImage *emptyImage = [[UIImage alloc]init];
    [self.searchBar setBackgroundImage:emptyImage];
    [self.searchBar setBackgroundColor:UIColorFromRGB(0x5F88E9)];
    
    // 네비게이션바 우측 상단 버튼 추가.
    UIButton *topRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [topRightBtn setFrame:CGRectMake(0, 0, 24 , 24)];
    [topRightBtn setImage:[UIImage imageNamed:@"ic_more_horiz"] forState:UIControlStateNormal];
    UIBarButtonItem *topRightBtnItem = [[UIBarButtonItem alloc]init];
    [topRightBtnItem setCustomView:topRightBtn];
    [self.navigationItem setRightBarButtonItem:topRightBtnItem];
    
    // db에서 데이터 읽기.
    self.totalArr = [[IdiomLib sharedIdiomLib] getDbTotalData];
    //self.totalArr = [[IdiomLib sharedIdiomLib] getRandomData];
}

#pragma mark - 테이블뷰 델리킷 구현

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.totalArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *cellDic = self.totalArr[indexPath.row];
    cell.idx = indexPath.row;
    cell.item = cellDic;
    
    [cell setDataCell:cellDic index:indexPath.row];
    
    // > block
    cell.block = ^(NSInteger idx, NSString *name){
        NSString *isNY;
        
        if([cellDic[@"Favorites"] isEqualToString:@"Y"]){
            isNY = @"N";
        }else{
            isNY = @"Y";
        }
        
        [[IdiomLib sharedIdiomLib] insertFavoriteData:isNY kkk:name];
        self.totalArr = [[IdiomLib sharedIdiomLib] getDbTotalData];
        [self.tableView reloadData];
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 서치바 델리킷 구현

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"%@", searchText);
    
    if([searchText isEqualToString:@""])
    {
        self.totalArr = [[IdiomLib sharedIdiomLib] getDbTotalData];
        [self.searchBar resignFirstResponder];
    }else{
        self.totalArr = [[IdiomLib sharedIdiomLib] findKeyWordData:searchText];
    }
    
    [self.tableView reloadData];
    
}

@end
