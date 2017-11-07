//
//  StudyModeVC.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 11. 7..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "StudyModeVC.h"

@interface StudyModeVC ()

@end

@implementation StudyModeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 네비게이션바 텍스트 삽입 및 텍스트 설정
    [self.navigationItem setTitle:@"학습"];
    
    _isModeSetting = true; // true = 사자성어 -> 뜻, false = 뜻 -> 사자성어
    _isRangeSetting = true; // true = 전체, false = 나만의 단어장
    
}

- (IBAction)stepperTimeAction:(UIStepper*)sender {
    NSUInteger value = sender.value;
    self.timeLabel.text = [NSString stringWithFormat:@"%lu초", (unsigned long)value];
}

- (IBAction)ModeIndexChange:(id)sender {
    switch (_modeSegControl.selectedSegmentIndex)
    {
        case 0:
            _isModeSetting = true;
            NSLog(@"사자성어 - > 뜻");
            break;
        case 1:
            _isModeSetting = false;
            NSLog(@"뜻 - > 사자성어");
            break;
        default:
            break;
    }
}

- (IBAction)RangeIndexChange:(id)sender {
    switch (_rangeSegControl.selectedSegmentIndex)
    {
        case 0:
            _isRangeSetting = true;
            NSLog(@"전체");
            break;
        case 1:
            _isRangeSetting = false;
            NSLog(@"나만의 단어장");
            break;
        default:
            break;
    }
}

- (IBAction)startBtnAction:(id)sender {
    StudyModeDVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"StudyModeDVC"];

    vc.isModeSetting = _isModeSetting;
    vc.isRangeSetting = _isRangeSetting;
    vc.waitTime = (float)self.stepperTime.value;
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
