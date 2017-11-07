//
//  StudyModeDVC.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 11. 7..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "BaseVC.h"

@interface StudyModeDVC : BaseVC

@property BOOL isModeSetting; // true = 사자성어 -> 뜻, false = 뜻 -> 사자성어
@property BOOL isRangeSetting; // true = 전체, false = 나만의 단어장
@property NSTimer *mainTimer;
@property NSTimer *subTimer;
@property NSInteger count;
@property float waitTime;
- (IBAction)nextBtnAction:(id)sender;
- (IBAction)previousBtnAction:(id)sender;

@property (strong, nonatomic) NSMutableArray *randomArr;
@property (strong, nonatomic) IBOutlet UILabel *view01Label;
@property (strong, nonatomic) IBOutlet UILabel *view02Label;
@property (strong, nonatomic) IBOutlet UILabel *view03Label;
@property (strong, nonatomic) IBOutlet UIButton *previousBtn;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;

@end
