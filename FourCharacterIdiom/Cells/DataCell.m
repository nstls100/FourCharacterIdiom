//
//  DataCell.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 27..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "DataCell.h"

@implementation DataCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)favoriteBtnClick:(id)sender {
    if (_block){
        _block(_idx, [_item objectForKey:@"KoreaCharacters"]);
        
        NSLog(@"in block");
    }
}

-(void)setDataCell:(NSDictionary*)cellDic index:(NSInteger)index
{
    NSString *chineseStr = cellDic[@"ChineseCharacters"];
    NSString *koreaStr = cellDic[@"KoreaCharacters"];
    NSString *meaningStr = cellDic[@"Meaning"];
    NSString *favoriteStr = cellDic[@"Favorites"];
    
    [self.chineseStrLabel setText:chineseStr];
    [self.koreaStrLabel setText:koreaStr];
    [self.meaningLabel setText:meaningStr];
    
    if([favoriteStr isEqualToString:@"Y"]){
        [_favoritesButton setImage:[UIImage imageNamed:@"ic_Favorites"] forState:UIControlStateNormal];
    }else{
        [_favoritesButton setImage:[UIImage imageNamed:@"ic_unFavorites"] forState:UIControlStateNormal];
    }
    
    
}

@end
