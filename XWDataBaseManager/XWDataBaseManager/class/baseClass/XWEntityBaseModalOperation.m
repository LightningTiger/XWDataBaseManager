//
//  XWEntityBaseManger.m
//  XWStringCategoryTest
//
//  Created by wzl on 15/11/5.
//  Copyright © 2015年 wzl. All rights reserved.
//

#import "XWEntityBaseModalOperation.h"
#import <objc/runtime.h>
#import "FMDatabaseAdditions.h"



@implementation XWEntityBaseModalOperation
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createTable];
    }
    return self;
}
#pragma mark - 表增删改查

- (NSString *)entityName{
    NSString*className = NSStringFromClass([self class]);
    NSString*characters = @"Operation";
    NSRange range = [className rangeOfString:characters options: NSLiteralSearch|NSBackwardsSearch];
    NSString *entityName = nil;
    if (range.length>0) {
       entityName = [className substringToIndex:range.location];
    }
    else{
        NSLog(@"modal Operation name is non-standard, please write modal name append 'Operation'. for example 'XWEntityUserModalOperation'");
    }

    return entityName;
}

- (BOOL)createTable{
    
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    if (queue==nil) {
        return NO;
    }
    
    [queue inDatabase:^(FMDatabase *db) {
        // 确定表名
        NSString *entityName = self.entityName;
      
        if (![DBHelper isTableOK:entityName withDB:db]) {
            // 初始化一个装sql的可变string
            NSMutableString * sqlQuery = [NSMutableString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (xw_id integer PRIMARY KEY autoincrement ", entityName];//xw_id 为
            
            const char * cClassName = [entityName UTF8String];
            id classM = objc_getClass(cClassName);
            unsigned int outCount, i;
            objc_property_t * properties = class_copyPropertyList(classM, &outCount);
            
            // 循环 得到属性名称  拼接数据库语句
            for (i = 0; i < outCount; i++) {
                objc_property_t property = properties[i];
                NSString * attributeName = [NSString stringWithUTF8String:property_getName(property)];
                const char *attrs = property_getAttributes(property);
                NSString* propertyAttributes = @(attrs);
                NSArray* attributeItems = [propertyAttributes componentsSeparatedByString:@","];
                NSString* attributeType = @"TEXT";
                if ([attributeItems containsObject:@"Tq"]) {
                    attributeType = @"integer";
                }
                else if ([attributeItems containsObject:@"TQ"]){
                    attributeType = @"integer";
                }
                else if ([attributeItems containsObject:@"TB"]){
                    attributeType = @"integer";
                }
                else if ([attributeItems containsObject:@"Ti"]){
                    attributeType = @"integer";
                }
                
                // 开始做拼接
                [sqlQuery appendFormat:@",%@ %@ ", attributeName,attributeType];
                if (i == outCount - 1) {
                    [sqlQuery appendString:@")"];
                    break;
                }
            }
            
            [db executeUpdate:sqlQuery];
        }
    
    }];

    return YES;
}

- (BOOL)addUniqueWithIndex:(NSString *)indexName{
    
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    if (queue == nil) {
        return NO;
    }
    
    [queue inDatabase:^(FMDatabase *db) {
        
        NSString *entityName = self.entityName;
        
        if ([DBHelper isTableOK:entityName withDB:db]) {
            NSString *sqlStr = [NSString stringWithFormat:@"DROP INDEX IF EXISTS idx_%@",indexName];
            [db executeUpdate:sqlStr];
            
            sqlStr= [NSString stringWithFormat:@"CREATE unique INDEX idx_%@ ON %@(%@);",indexName,entityName,indexName];
            [db executeUpdate:sqlStr];
        }
    }];
    
    return YES;
    
}

#pragma mark - 记录增删改查
- (BOOL)insertIntoEnityToDB:(XWEntityBaseModal *)enity{
    
    NSLog(@"this function need subclass Override");
    
    return NO;
}

- (BOOL)deleteEntityFromDB:(id)condition{
    
    NSLog(@"this function need subclass Override");
    
    return NO;
}

- (XWEntityBaseModal *)getEntityByCondition:(id)condition{
    
    NSLog(@"this function need subclass Override");
    
    return nil;
}

-(NSArray *)getAllEntity{
    
    return nil;
}

-(NSUInteger)getEntityCount{
    
    __block NSUInteger count = 0;
    NSString*sql = [NSString stringWithFormat:@"SELECT COUNT(*) FROM %@",self.entityName];
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    if (queue==nil) {
        
        return NO;
    }
    
    [queue inDatabase:^(FMDatabase *db) {
         count = (NSUInteger)[db intForQuery:sql];
    }];
    
    return count;
}

-(BOOL)clearEntityData{
    NSString*sql = [NSString stringWithFormat:@"TRUNCATE %@",self.entityName];
    FMDatabaseQueue *queue = [DBHelper getDatabaseQueue];
    if (queue==nil) {
        
        return NO;
    }
    
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:sql];
    }];
    
    return YES;
}
@end
