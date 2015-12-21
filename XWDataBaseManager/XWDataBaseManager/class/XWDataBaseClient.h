//
//  XWDataBaseClient.h
//  XWStringCategoryTest
//
//  Created by wzl on 15/11/6.
//  Copyright © 2015年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XWEntityUserModalOperation.h"

@interface XWDataBaseClient : NSObject

@property (nonatomic,strong) XWEntityUserModalOperation *userModalOperation;

+ (XWDataBaseClient*)shareInstance;
- (BOOL)initDataBase:(NSString*)dataBaseName;
- (void)releaseDataBase;
- (void)clearDataBase;
@end
