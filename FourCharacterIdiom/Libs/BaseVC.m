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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
