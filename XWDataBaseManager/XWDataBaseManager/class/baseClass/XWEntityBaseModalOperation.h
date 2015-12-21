//
//  XWEntityBaseManger.h
//  XWStringCategoryTest
//  表模型管理基类
//  Created by wzl on 15/11/5.
//  Copyright © 2015年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBHelper.h"
#import "XWEntityBaseModal.h"

/**
 *  @brief  表模型管理基类
 *
 *  注意管理基类的命名规范 
 *  因为涉及到sqllite建表时表名自动命名
 *  必须为表模型类名称+Operation
 *  <亮哥的殷殷叮嘱，一定要记得哦!!!>
 *
 */
@interface XWEntityBaseModalOperation : NSObject

/** 表名 */
@property (nonatomic,strong,readonly) NSString*entityName;

/**
 *  增加唯一键索引
 *
 *  @param indexName 索引名
 *
 *  @return 成功YES
 */
- (BOOL)addUniqueWithIndex:(NSString*)indexName;
/**
 *  获取表中所有的记录总数
 *
 *  @return 记录总数
 */
- (NSUInteger)getRecordCountInEntity;
/**
 *  清空表中所有记录
 *
 *  @return 成功YES
 */
- (BOOL)clearEntityData;

#pragma mark - 需要重写
/**
 *  增加某条记录
 *
 *  @param enity 
 *
 *  @return 成功YES
 */
- (BOOL)insertIntoEnityToDB:(XWEntityBaseModal*)enity;
/**
 *  删除某条记录
 *
 *  @param condition 条件
 *
 *  @return 成功YES
 */
- (BOOL)deleteEntityFromDB:(id)condition;
/**
 *  获取某条记录
 *
 *  @param condition 条件
 *
 *  @return 成功YES
 */
- (XWEntityBaseModal*)getEntityByCondition:(id)condition;
/**
 *  获取所有的记录
 *
 *  @return 记录数组
 */
- (NSArray*)getAllRecordInEntity;


@end
