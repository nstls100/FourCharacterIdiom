//
//  BaseVC.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 27..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 네비게이션컨트롤러 폰트 컬러 및 크기 설정
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    
    // 서치바 삽입시에 블랙라인 나타나는 부분 제거
    UIImage *emptyImage = [[UIImage alloc]init];

    [self.navigationController.navigationBar setBackgroundImage:emptyImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:emptyImage];
    
    [self.navigationController.navigationBar setTintColor:UIColorFromRGB(0x5F88E9)];
    [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(0x5F88E9)];
    self.navigationController.navigationBar.translucent = NO;
    
    // SWRevealViewController 설정.
    SWRevealViewController *revealController = self.revealViewController;
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    // 네비게이션 바 좌측 상단 버튼 추가.
    UIButton *topLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [topLeftBtn setFrame:CGRectMake(0, 0, 24, 24)];
    [topLeftBtn setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [topLeftBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *topLeftBtnItem = [[UIBarButtonItem alloc]init];
    [topLeftBtnItem setCustomView:topLeftBtn];
    [self.navigationItem setLeftBarButtonItem:topLeftBtnItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
