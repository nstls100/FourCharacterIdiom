//
//  MainVC.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 26..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "BaseVC.h"
#import "DataCell.h"
#import "DetailWordVC.h"

@interface MainVC : BaseVC<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, TableViewSelectDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIView *viewIdiom;
@property (strong, nonatomic) NSMutableArray *totalArr;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *tmp;



@end
