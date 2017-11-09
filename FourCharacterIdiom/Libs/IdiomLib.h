//
//  IdiomLib.h
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 27..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "CommonLib.h"
#import "FMDB.h"



@interface IdiomLib : NSObject

+ (IdiomLib*)sharedIdiomLib;

-(NSMutableArray*)getDbTotalData;
-(NSMutableArray*)findKeyWordData:(NSString *)keyWord;
-(NSMutableArray*)findFavoriteKeyWordData:(NSString *)keyWord;
-(void)insertFavoriteData:(NSString *)ny kkk:(NSString*)korean;
-(NSString*)getDbPath;
-(void)copyDbFile;
-(NSMutableArray*)getRandomData;
-(void)deleteFavoritesItems;
@end
