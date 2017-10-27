//
//  IdiomLib.m
//  FourCharacterIdiom
//
//  Created by 이재홍 on 2017. 10. 27..
//  Copyright © 2017년 이재홍. All rights reserved.
//

#import "IdiomLib.h"

@implementation IdiomLib
static IdiomLib *sharedIdiomObj;

+ (IdiomLib*)sharedIdiomLib
{
    if(sharedIdiomObj == nil)
    {
        sharedIdiomObj = [[IdiomLib alloc]init];
    }
    return sharedIdiomObj;
}

-(NSMutableArray*)dbTest
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"idiom" ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    
    if (![db open]) {
        db = nil;
    }
    
    NSMutableArray *idiomData = [[NSMutableArray alloc]init];
    
    FMResultSet *s = [db executeQuery:@"SELECT * FROM data"];
    while ([s next]) {
        
        NSMutableDictionary *tmpIdiom = [[NSMutableDictionary alloc]init];
        
        NSString *chineseStr = [s stringForColumn:@"ChineseCharacters"];
        [tmpIdiom setObject:chineseStr forKey: @"ChineseCharacters"];
        
        NSString *koreanStr = [s stringForColumn:@"KoreaCharacters"];
        [tmpIdiom setObject:koreanStr forKey: @"KoreaCharacters"];
        
        NSString *meaningStr = [s stringForColumn:@"Meaning"];
        [tmpIdiom setObject:meaningStr forKey: @"Meaning"];
        
        [idiomData addObject:tmpIdiom];
    }
    
    [db close];
    return idiomData;
    
}

-(NSMutableArray*)dbTest1:(NSString *)keyWord
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"idiom" ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    
    if (![db open]) {
        db = nil;
    }
    
    NSMutableArray *idiomData = [[NSMutableArray alloc]init];
    
    FMResultSet *s = [db executeQuery:@"SELECT * FROM data WHERE KoreaCharacters LIKE ?",
                       [NSString stringWithFormat:@"%%%@%%", keyWord]];
    
    while ([s next]) {
        
        NSMutableDictionary *tmpIdiom = [[NSMutableDictionary alloc]init];
        
        NSString *chineseStr = [s stringForColumn:@"ChineseCharacters"];
        [tmpIdiom setObject:chineseStr forKey: @"ChineseCharacters"];
        
        NSString *koreanStr = [s stringForColumn:@"KoreaCharacters"];
        [tmpIdiom setObject:koreanStr forKey: @"KoreaCharacters"];
        
        NSString *meaningStr = [s stringForColumn:@"Meaning"];
        [tmpIdiom setObject:meaningStr forKey: @"Meaning"];
        
        [idiomData addObject:tmpIdiom];
    }
    
    [db close];
    return idiomData;
    
}

@end
