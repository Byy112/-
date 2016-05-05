//
//  Manager.m
//  Duitang
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Manager.h"
#import "FMDB.h"

#import "User.h"
#import "Pictures.h"
#import "Album.h"

#define kNameDB @"Mydatabase.sqlite"

@interface Manager ()

@property (nonatomic, retain)FMDatabaseQueue * queue;

@end

@implementation Manager

+ (Manager *)sharedManager {
    static Manager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[Manager alloc] init];
    });
    return manager;
    
}

- (id)init{
    self = [super init];
    if (self) {
        NSFileManager * fileManager = [NSFileManager defaultManager];
        NSString *databasePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject] stringByAppendingString:[NSString stringWithFormat:@"%@", kNameDB]];
        
        if ([fileManager fileExistsAtPath:databasePath]) {
            self.queue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
        }else{
            
            NSString *defaultDBPath = [[NSBundle mainBundle] pathForResource:@"Mydatabase" ofType:@"sqlite"];
            BOOL success =  [fileManager copyItemAtPath:defaultDBPath toPath:databasePath error:nil];
            if (!success)
            {
                NSAssert1(0, @"Failed to create writable database file with message '%i'.", success);
            }
            else
            {
                self.queue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
            }
        }
    }
    return self;
}
-(BOOL)openDatabase{
    
    __block BOOL ret = NO;
    [_queue inDatabase:^(FMDatabase *database){
        if (![database open]) {
            ret = YES;
        }else{
            
        }
    }];
    return ret;
}
-(void)closeDatabase
{
    [_queue inDatabase:^(FMDatabase *database){
        if ([database open]) {
            [database close];
        }
    }];
    
}

NSString * const kSQLInsertUserTable = @"insert into UserTable (image,title,comment_count,blog_id) values(?,?,?,?)";
- (void)insertUser:(User *)p
{
    //    NSString *age = [NSString stringWithFormat:@"%ld", (long)p.age];
    NSString * image = p.image;
    NSString * title = p.title;
    NSString * comment_count = [NSString stringWithFormat:@"%ld",(long)p.comment_count];
    NSString * blog_id = p.blog_id;
    [_queue inDatabase:^(FMDatabase *db) {
        [db open];
        BOOL b = [db executeUpdate:kSQLInsertUserTable, image, title, comment_count, blog_id];
        if (b) {
            NSLog(@"插入成功");
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏成功，已保存到我的专辑" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            
        } else {
            NSLog(@"插入失败");
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            
        }
        
//        b ? NSLog(@"插入成功"):NSLog(@"插入失败");
    }];
}


NSString * const kSQLDelegateUserTable = @"delete from UserTable where blog_id = ?";

- (void)deleteUser:(NSString *)str{
    [_queue inDatabase:^(FMDatabase *database) {
        [database open];
        BOOL b = [database executeUpdate:kSQLDelegateUserTable,str];
        b ? NSLog(@"删除成功"):NSLog(@"删除失败");
        [database close];
    }];
    
}

NSString *const kSQLUpdateUserTable = @"update UserTable set image = ? , title = ? , comment_count = ? where blog_id = ?";
- (void)updateTable:(NSString *)str1 :(NSString *)str2 :(NSString *)str3 :(NSString *)str4
{
    [_queue inDatabase:^(FMDatabase *db) {
        [db open];
        BOOL b = [db executeUpdate:kSQLUpdateUserTable, str1, str2, str3, str4];
        b ? NSLog(@"更新成功"):NSLog(@"更新失败");
        [db close];
    }];
    
}
NSString * const kSQLSelectUserTable = @"select * from UserTable";
- (NSArray *)selectUser
{
    __block NSMutableArray *arr = [[NSMutableArray alloc] init];
    [_queue inDatabase:^(FMDatabase *database) {
        [database open];
        FMResultSet *result =[database executeQuery:kSQLSelectUserTable];
        while ([result next]) {
            User *p = [[User alloc] init];
            p.image = [result stringForColumn:@"image"];
            p.title = [result stringForColumn:@"title"];
            p.comment_count = [result stringForColumn:@"comment_count"].integerValue;
            p.blog_id = [result stringForColumn:@"blog_id"];
            [arr addObject:p];
        }
        [database close];
    }];
    return arr;
    
}

/************************************************************************************/
//存放Pictures对象

NSString * const kSQLInsertPictureTable = @"insert into PictureTable (image) values(?)";
- (void)insertPictures:(Pictures *)p
{
    //    NSString *age = [NSString stringWithFormat:@"%ld", (long)p.age];
    NSString * image = p.image;
 
    [_queue inDatabase:^(FMDatabase *db) {
        [db open];
        BOOL b = [db executeUpdate:kSQLInsertPictureTable, image];
        if (b) {
            NSLog(@"插入成功");
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片下载成功，已保存到我的图片" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            
        } else {
            NSLog(@"插入失败");
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"图片下载失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            
        }
        
//        b ? NSLog(@"插入成功"):NSLog(@"插入失败");
    }];
}


NSString * const kSQLDelegatePictureTable = @"delete from PictureTable where image = ?";

- (void)deletePictures:(NSString *)str {
    [_queue inDatabase:^(FMDatabase *database) {
        [database open];
        BOOL b = [database executeUpdate:kSQLDelegatePictureTable,str];
        b ? NSLog(@"删除成功"):NSLog(@"删除失败");
        [database close];
    }];
    
}

NSString *const kSQLUpdatePictureTable = @"update PictureTable set image = ? where image = ?";
- (void)updatePicturesTable:(NSString *)str
{
    [_queue inDatabase:^(FMDatabase *db) {
        [db open];
        BOOL b = [db executeUpdate:kSQLUpdatePictureTable, str];
        b ? NSLog(@"更新成功"):NSLog(@"更新失败");
        [db close];
    }];
    
}
NSString * const kSQLSelectPictureTable = @"select * from PictureTable";
- (NSArray *)selectPicture
{
    __block NSMutableArray *arr = [[NSMutableArray alloc] init];
    [_queue inDatabase:^(FMDatabase *database) {
        [database open];
        FMResultSet *result =[database executeQuery:kSQLSelectPictureTable];
        while ([result next]) {
            Pictures *p = [[Pictures alloc] init];
            p.image = [result stringForColumn:@"image"];
            
            [arr addObject:p];
        }
        [database close];
    }];
    return arr;
    
}
/********************************************************************/

NSString * const kSQLInsertAlbumTable = @"insert into AlbumTable (album_name,image,album_id) values(?,?,?)";
- (void)insertAlbum:(Album *)p
{
    //    NSString *age = [NSString stringWithFormat:@"%ld", (long)p.age];
    NSString * album_name = p.album_name;
    NSString * image = p.image;
    NSString * album_id = p.album_id;
    [_queue inDatabase:^(FMDatabase *db) {
        [db open];
        BOOL b = [db executeUpdate:kSQLInsertAlbumTable, album_name, image,album_id];
        if (b) {
            NSLog(@"插入成功");
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"喜欢成功，已保存到我喜欢的专辑" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            
        } else {
            NSLog(@"插入失败");
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"喜欢失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            
        }
        
        //        b ? NSLog(@"插入成功"):NSLog(@"插入失败");
    }];
}


NSString * const kSQLDelegateAlbumTable = @"delete from AlbumTable where album_id = ?";

- (void)deleteAlbum:(NSString *)str {
    [_queue inDatabase:^(FMDatabase *database) {
        [database open];
        BOOL b = [database executeUpdate:kSQLDelegateAlbumTable,str];
        b ? NSLog(@"删除成功"):NSLog(@"删除失败");
        [database close];
    }];
    
}

NSString *const kSQLUpdateAlbumTable = @"update UserTable set album_name = ? , image = ? where album_id = ?";
- (void)updateAlbumTable:(NSString *)str1 :(NSString *)str2 :(NSString *)str3
{
    [_queue inDatabase:^(FMDatabase *db) {
        [db open];
        BOOL b = [db executeUpdate:kSQLUpdateAlbumTable, str1, str2, str3];
        b ? NSLog(@"更新成功"):NSLog(@"更新失败");
        [db close];
    }];
    
}
NSString * const kSQLSelectAlbumTable = @"select * from AlbumTable";
- (NSArray *)selectAlbum
{
    __block NSMutableArray *arr = [[NSMutableArray alloc] init];
    [_queue inDatabase:^(FMDatabase *database) {
        [database open];
        FMResultSet *result =[database executeQuery:kSQLSelectAlbumTable];
        while ([result next]) {
            Album *p = [[Album alloc] init];
            p.album_name = [result stringForColumn:@"album_name"];
            p.image = [result stringForColumn:@"image"];
            p.album_id = [result stringForColumn:@"album_id"];
            [arr addObject:p];
        }
        [database close];
    }];
    return arr;
    
}



@end
