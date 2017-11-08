//
//  DetailWordVC.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 11. 8..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "DetailWordVC.h"

@interface DetailWordVC ()

@end

@implementation DetailWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 네비게이션 바 좌측 상단 버튼 추가.
    UIButton *topLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [topLeftBtn setFrame:CGRectMake(0, 0, 24, 24)];
    [topLeftBtn setImage:[UIImage imageNamed:@"ic_keyboard_arrow_left"] forState:UIControlStateNormal];
    [topLeftBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *topLeftBtnItem = [[UIBarButtonItem alloc]init];
    [topLeftBtnItem setCustomView:topLeftBtn];
    [self.navigationItem setLeftBarButtonItem:topLeftBtnItem];
    
    // 네비게이션바 텍스트 삽입 및 텍스트 설정
    //[self.navigationItem setTitle:@"학습"];
    
    NSDictionary *tmp = [_Delegate getMessage];
    
    _view01Label.text = tmp[@"KoreaCharacters"];
    _view02Label.text = tmp[@"ChineseCharacters"];
    _view03Label.text = tmp[@"Meaning"];
}

-(void)backBtnAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
