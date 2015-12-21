//
//  DBHelper.m
//  RCloudMessage
//
//  Created by 杜立召 on 15/5/22.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "DBHelper.h"



@implementation DBHelper

static FMDatabaseQueue* g_databaseQueue = nil;
static NSString* g_databaseName = nil;

+ (FMDatabaseQueue*)getDatabaseQueue
{
    if (!g_databaseQueue) {
        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* documentDirectory = [paths objectAtIndex:0];
        NSString* dbPath = [documentDirectory stringByAppendingPathComponent:g_databaseName];
        g_databaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }

    return g_databaseQueue;
}

+ (BOOL)initQueueByDataBaseName:(NSString *)name{
    if (![g_databaseName isEqualToString:name]) {
        g_databaseName = name;
        [DBHelper releaseDataBaseQueue];
    }
    
    return ([DBHelper getDatabaseQueue]!=nil)?YES:NO;
}

+ (BOOL)releaseDataBaseQueue{
    
    if (g_databaseQueue) {
        [g_databaseQueue close];
        g_databaseQueue = nil;
    }

    return YES;
}

+ (BOOL)isTableOK:(NSString*)tableName withDB:(FMDatabase*)db{
    
    BOOL isOK = NO;
    
    FMResultSet* rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
    while ([rs next]) {
        NSInteger count = [rs intForColumn:@"count"];
        
        if (0 == count) {
            isOK = NO;
        }
        else {
            isOK = YES;
        }
    }
    [rs close];
    
    return isOK;
}

@end
