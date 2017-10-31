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
    [self.navigationItem setTitle:@"나만의 단어장 "];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = @"xx";
    
    return cell;
}

@end
