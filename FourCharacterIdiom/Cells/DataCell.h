//
//  DataCell.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 27..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <UIKit/UIKit.h>

// > block
typedef void(^CustomTableViewCellBlock)(NSInteger, NSString *);

@interface DataCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *koreaStrLabel;
@property (strong, nonatomic) IBOutlet UILabel *chineseStrLabel;
@property (strong, nonatomic) IBOutlet UILabel *meaningLabel;
@property (strong, nonatomic) IBOutlet UIButton *favoritesButton;

@property (nonatomic) NSInteger idx;        // > cell index
@property (nonatomic) NSDictionary *item;   // > data item
@property (nonatomic, copy) CustomTableViewCellBlock block; // >block

- (IBAction)favoriteBtnClick:(id)sender;
-(void)setDataCell:(NSDictionary*)cellDic index:(NSInteger)index;
@end
