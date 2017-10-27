//
//  DataCell.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 27..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *koreaStrLabel;
@property (strong, nonatomic) IBOutlet UILabel *chineseStrLabel;
@property (strong, nonatomic) IBOutlet UILabel *meaningLabel;

-(void)setDataCell:(NSDictionary*)cellDic index:(NSInteger)index;
@end
