//
//  MainVC.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 26..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "BaseVC.h"
#import "DataCell.h"

@interface MainVC : BaseVC<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIView *viewIdiom;
@property (strong, nonatomic) NSMutableArray *resultArr;

@end
