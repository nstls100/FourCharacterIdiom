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

- (void)copyDbFile
{
    /*
        ios 앱 번들 디렉토리는 읽기 전용이므로 파일을 수정하려면 먼저 앱 번들에서 파일을 Document에 
        복사 한후 사용하여야 한다.
     
        //NSString *path = [[NSBundle mainBundle] pathForResource:@"idiom" ofType:@"db"];
    */
    
    NSArray *fileList = [NSArray arrayWithObjects:@"idiom.db", nil];
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    for (NSInteger i = 0; i < [fileList count]; i++) {
        NSString *fileName = [fileList objectAtIndex:i];
        NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
        NSString *toPath = [documentsDirectory stringByAppendingPathComponent:fileName];
        
        // documents 폴더에 파일이 존재하지 않으면 복사
        if (![fileManager fileExistsAtPath:toPath]) {
            if ([fileManager copyItemAtPath:filePath toPath:toPath error:nil]) {
                NSLog(@"%@", toPath);
            } else {
                NSLog(@"0");
            }
        }
    }
}

-(NSMutableArray*)getDbTotalData
{
    FMDatabase *db = [FMDatabase databaseWithPath:[self getDbPath]];
    
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
        
        NSString *favorites = [s stringForColumn:@"Favorites"];
        [tmpIdiom setObject:favorites forKey: @"Favorites"];
        
        [idiomData addObject:tmpIdiom];
    }
    
    [db close];
    return idiomData;
    
}

-(NSMutableArray*)findKeyWordData:(NSString *)keyWord
{
    FMDatabase *db = [FMDatabase databaseWithPath:[self getDbPath]];
    
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
        
        NSString *favorites = [s stringForColumn:@"Favorites"];
        [tmpIdiom setObject:favorites forKey: @"Favorites"];
        
        [idiomData addObject:tmpIdiom];
    }
    
    [db close];
    return idiomData;
    
}

-(NSMutableArray*)findFavoriteKeyWordData:(NSString *)keyWord
{
    FMDatabase *db = [FMDatabase databaseWithPath:[self getDbPath]];
    
    if (![db open]) {
        db = nil;
    }
    
    NSMutableArray *idiomData = [[NSMutableArray alloc]init];
    
    FMResultSet *s = [db executeQuery:@"SELECT * FROM data WHERE Favorites LIKE ?", [NSString stringWithFormat:@"%%%@%%", keyWord]];
    
    while ([s next]) {
        
        NSMutableDictionary *tmpIdiom = [[NSMutableDictionary alloc]init];
        
        NSString *chineseStr = [s stringForColumn:@"ChineseCharacters"];
        [tmpIdiom setObject:chineseStr forKey: @"ChineseCharacters"];
        
        NSString *koreanStr = [s stringForColumn:@"KoreaCharacters"];
        [tmpIdiom setObject:koreanStr forKey: @"KoreaCharacters"];
        
        NSString *meaningStr = [s stringForColumn:@"Meaning"];
        [tmpIdiom setObject:meaningStr forKey: @"Meaning"];
        
        NSString *favorites = [s stringForColumn:@"Favorites"];
        [tmpIdiom setObject:favorites forKey: @"Favorites"];
        
        [idiomData addObject:tmpIdiom];
    }
    
    [db close];
    return idiomData;
    
}

-(NSString*)getDbPath
{
    /*
        Document에 있는 idiom.db파일 경로를 가져옴.
    */
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString* documentDir = [NSString stringWithFormat:@"%@/%@",[paths objectAtIndex:0], @"idiom.db"];
    NSLog(@"%@", documentDir);
    
    return documentDir;
}

-(void)insertFavoriteData:(NSString *)ny kkk:(NSString*)korean
{
    FMDatabase *db = [FMDatabase databaseWithPath:[self getDbPath]];
    
    if (![db open]) {
        db = nil;
    }
    
    BOOL success = [db executeUpdate:@"UPDATE data SET Favorites = ? WHERE KoreaCharacters = ?",ny,korean];
    
    if(success){
        NSLog(@"succ");
    }else{
        NSLog(@"fail");
    }
    
    [db close];
}

@end
