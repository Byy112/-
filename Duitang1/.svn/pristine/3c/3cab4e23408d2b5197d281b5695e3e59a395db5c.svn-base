//
//  Manager.h
//  Duitang
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class User;
@class Pictures;
@class Album;
@interface Manager : NSObject

@property (nonatomic, retain)UINavigationController * navigationController;

+ (Manager *)sharedManager;



//存放User对象
- (void)insertUser:(User *)p;
- (void)deleteUser:(NSString *)str;
- (void)updateTable:(NSString *)str1 :(NSString *)str2 :(NSString *)str3 :(NSString *)str4;
- (NSArray *)selectUser;


//存放Pictures对象
- (void)insertPictures:(Pictures *)p;
- (void)deletePictures:(NSString *)str;
- (void)updatePicturesTable:(NSString *)str;
- (NSArray *)selectPicture;

//存放Pictures对象
- (void)insertAlbum:(Album *)p;
- (void)deleteAlbum:(NSString *)str;
- (void)updateAlbumTable:(NSString *)str1 :(NSString *)str2 :(NSString *)str3;
- (NSArray *)selectAlbum;

@end
