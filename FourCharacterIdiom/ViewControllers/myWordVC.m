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
    
    _favoritesArr =  [[IdiomLib sharedIdiomLib] findFavoriteKeyWordData:@"Y"];
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

@end
