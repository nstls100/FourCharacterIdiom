//
//  DetailWordVC.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 11. 8..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "BaseVC.h"

@interface DetailWordVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *view01Label;
@property (strong, nonatomic) IBOutlet UILabel *view02Label;
@property (strong, nonatomic) IBOutlet UILabel *view03Label;
@property (nonatomic, retain) id <TableViewSelectDelegate> Delegate;

@end
