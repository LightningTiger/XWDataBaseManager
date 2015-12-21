//
//  XWEntityUserManger.m
//  XWStringCategoryTest
//
//  Created by wzl on 15/11/6.
//  Copyright © 2015年 wzl. All rights reserved.
//

#import "XWEntityUserModalOperation.h"

@implementation XWEntityUserModalOperation
- (instancetype)init{
    self = [super init];
    if (self) {
        [self addUniqueWithIndex:@"userID"];
    }
    return self;
}
@end
