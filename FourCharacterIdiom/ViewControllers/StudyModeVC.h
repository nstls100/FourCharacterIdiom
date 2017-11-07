//
//  StudyModeVC.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 11. 7..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "BaseVC.h"
#import "StudyModeDVC.h"

@interface StudyModeVC : BaseVC

@property (strong, nonatomic) IBOutlet UISegmentedControl *modeSegControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *rangeSegControl;
@property BOOL isModeSetting; // true = 사자성어 -> 뜻, false = 뜻 -> 사자성어
@property BOOL isRangeSetting; // true = 전체, false = 나만의 단어장
@property (strong, nonatomic) IBOutlet UIStepper *stepperTime;
- (IBAction)stepperTimeAction:(UIStepper*)sender;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

- (IBAction)ModeIndexChange:(id)sender;
- (IBAction)RangeIndexChange:(id)sender;
- (IBAction)startBtnAction:(id)sender;

@end
