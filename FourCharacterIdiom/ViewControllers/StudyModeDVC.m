//
//  StudyModeDVC.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 11. 7..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "StudyModeDVC.h"

@interface StudyModeDVC ()

@end

@implementation StudyModeDVC

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
    [self.navigationItem setTitle:@"학습"];
    
    if(_isRangeSetting){
        self.randomArr = [[IdiomLib sharedIdiomLib] getDbTotalData];
    }else{
        self.randomArr = [[IdiomLib sharedIdiomLib] findFavoriteKeyWordData:@"Y"];
    }
    
    self.count = 0;
    [self work];
}

-(void)backBtnAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) startTimer {
    if (!self.mainTimer) {
        self.mainTimer = [NSTimer scheduledTimerWithTimeInterval:_waitTime
                                                  target:self
                                                selector:@selector(updateTimer:)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

-(void) stopTimer {
    if ([self.mainTimer isValid]) {
        [self.mainTimer invalidate];
    }
    self.mainTimer = nil;
}

-(void) work
{
    [self startTimer];
    
    NSDictionary *dic = self.randomArr[_count];
    _view01Label.text = dic[@"KoreaCharacters"];
    _view02Label.text = dic[@"ChineseCharacters"];
    _view03Label.text = dic[@"Meaning"];
    
    [self setHiddenLabel:YES];
    [_previousBtn setEnabled:NO];
    [_nextBtn setEnabled:NO];
}

- (void) updateTimer:(NSTimer *)incomingTimer
{
    if(_count > self.randomArr.count)
        return;
    
    [self setHiddenLabel:NO];
    [_previousBtn setEnabled:YES];
    [_nextBtn setEnabled:YES];
    [self stopTimer];
}

-(void) setHiddenLabel : (BOOL) isHidden
{
    if(_isModeSetting){
        [_view01Label setHidden:isHidden];
        [_view02Label setHidden:isHidden];
    }else{
        [_view03Label setHidden:isHidden];
    }
}
- (IBAction)nextBtnAction:(id)sender {
     _count++;
    
    if(_count >= self.randomArr.count){
        _count = self.randomArr.count;
        [self showMessage:@"마지막 단어입니다."];
    }else{
        [self work];
    }
}

- (IBAction)previousBtnAction:(id)sender {
    _count--;
    
    if(_count < 0){
        _count = 0;
        [self showMessage:@"첫번째 단어입니다."];
    }else{
        [self work];
    }
    
    
}
@end
