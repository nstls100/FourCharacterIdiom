//
//  myWordVC.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 31..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "myWordVC.h"

@interface myWordVC ()

@end

@implementation myWordVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // 네비게이션바 텍스트 삽입 및 텍스트 설정
    [self.navigationItem setTitle:@"나만의 단어장"];
    
    // 네비게이션 바 좌측 상단 버튼 추가.
    UIButton *topRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [topRightBtn setFrame:CGRectMake(0, 0, 24, 24)];
    [topRightBtn setImage:[UIImage imageNamed:@"ic_delete"] forState:UIControlStateNormal];
    [topRightBtn addTarget:self action:@selector(DeleteBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *topRightBtnItem = [[UIBarButtonItem alloc]init];
    [topRightBtnItem setCustomView:topRightBtn];
    [self.navigationItem setRightBarButtonItem:topRightBtnItem];
    
    _favoritesArr =  [[IdiomLib sharedIdiomLib] findFavoriteKeyWordData:@"Y"];
}

-(void)DeleteBtnAction:(UIButton *)sender
{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"경고"
                                  message:@"전체 삭제하시겠습니까?"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [[IdiomLib sharedIdiomLib] deleteFavoritesItems];
                             _favoritesArr =  [[IdiomLib sharedIdiomLib] findFavoriteKeyWordData:@"Y"];
                             [self.tableView reloadData];
                             
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

#pragma mark - 나만의 단어장 tableView 델리킷

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _favoritesArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *cellDic = _favoritesArr[indexPath.row];
    
    [cell setDataCell:cellDic index:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _tmp = self.favoritesArr[indexPath.row];
    
    DetailWordVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailWordVC"];
    vc.Delegate = self;
    
    [self.navigationController pushViewController:vc animated:true];
    
}

-(NSDictionary *) getMessage{
    return _tmp;
}

@end
