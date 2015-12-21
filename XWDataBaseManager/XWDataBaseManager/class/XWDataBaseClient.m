//
//  XWDataBaseClient.m
//  XWStringCategoryTest
//
//  Created by wzl on 15/11/6.
//  Copyright © 2015年 wzl. All rights reserved.
//

#import "XWDataBaseClient.h"

@implementation XWDataBaseClient

+ (XWDataBaseClient*)shareInstance{
    static XWDataBaseClient *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
        [instance initDataBase:nil];
    });
    
    return instance;
}

- (BOOL)initDataBase:(NSString *)dataBaseName{

    if (dataBaseName == nil) {
        dataBaseName = @"XWDataBasePredicateTest";
    }
    
    return [DBHelper initQueueByDataBaseName:dataBaseName];
}

- (void)releaseDataBase{
    [DBHelper releaseDataBaseQueue];
}

-(void)clearDataBase{
    //清空所有的表记录 调用表实体操作类的方法即可
    [self.userModalOperation clearEntityData];
}

@end
