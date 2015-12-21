//
//  XWDataBase.h
//  XWStringCategoryTest
//  表模型基类
//  Created by wzl on 15/11/5.
//  Copyright © 2015年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  @brief  表模型基类
 *
 *  在子类中添加实体时请注意
 *  本工具类建表时暂时仅支持TEXT和integer
 *  创建表的规则是将浮点数和NSString用TEXT类型存储，
 *  NSInteger、BOOL、int、NSUInteger用integer存储（BOOL定义NO:0、YES:1）
 *  < 忘记时常来看看哦 ^_^ >
 *
 */
@interface XWEntityBaseModal : NSObject

@end
