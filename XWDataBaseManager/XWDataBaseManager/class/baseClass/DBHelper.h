//
//  DBHelper.h
//  RCloudMessage
//
//  Created by 杜立召 on 15/5/22.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface DBHelper : NSObject
/**
 *  获取数据库操作句柄队列
 *
 *  @return 数据库队列
 */
+ (FMDatabaseQueue*)getDatabaseQueue;

/**
 *  初始化数据库
 *
 *  @param name 数据库名
 *
 *  @return 成功返回YES
 */
+ (BOOL)initQueueByDataBaseName:(NSString*)name;

/**
 *  释放数据库队列
 *
 *  @return 成功返回YES
 */
+ (BOOL)releaseDataBaseQueue;

/**
 *  检查数据库是否存在某表
 *
 *  @param tableName 表名
 *  @param db        数据库操作句柄
 *
 *  @return 存在返回YES
 */
+ (BOOL)isTableOK:(NSString*)tableName withDB:(FMDatabase*)db;
@end

