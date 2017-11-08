//
//  myWordVC.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 31..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "BaseVC.h"
#import "DataCell.h"
#import "DetailWordVC.h"

@interface myWordVC : BaseVC<UITableViewDelegate, UITableViewDataSource, TableViewSelectDelegate>

@property (strong, nonatomic) NSMutableArray *favoritesArr;
@property (strong, nonatomic) NSDictionary *tmp;
@end
